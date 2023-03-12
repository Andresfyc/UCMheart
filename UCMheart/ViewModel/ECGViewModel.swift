//
//  ECGViewModel.swift
//  UCMheart
//
//  Created by Andres Felipe Yunda Castillo on 12/3/23.
//

import Foundation
import HealthKit


final class ECGViewModel: ObservableObject {
    
    private let healthStore = HKHealthStore()
    private var ecgTotal = 0
    
    @Published var ecg: [ECGmodel] = []
    
    init(){
        load()
        ecg = getAllECG()
    }
    
    // Solicitar autorización de HealthKit para leer información de ECG.
    func requestAuthorization(completion: @escaping (Bool) -> Void ) {
        let healthKitelectrocardiogramTypeToRead: Set<HKObjectType> = [HKObjectType.electrocardiogramType()]
        
        guard HKHealthStore.isHealthDataAvailable() else {
            return
        }
        
        healthStore.requestAuthorization(toShare: nil, read: healthKitelectrocardiogramTypeToRead){ (authsuccess, autherror) in
            if let autherror = autherror {
                print("HealthKit Authorization error:", autherror.localizedDescription)
            }
            if authsuccess {
                print("¡La solicitud de autorización de HealthKit de lectura de ECG fue exitosa!")
            } else {
                print("La autorización de HealthKit de lectura de ECG no tuvo éxito.")
            }
            
        }
    }
    
    func load() {
        print("Load")
        var counter = 0
        self.getECGsCount { (ecgsCount) in
            print("ECGs totales \(ecgsCount)")
            if ecgsCount < 1 {
                print("No tienes ECGs disponibles")
                return
            } else {
                for i in 0...ecgsCount - 1 {
                    print("Entra -------> ")
                    self.getECGs(counter: i) { (ecgResults,ecgDate)   in
                        DispatchQueue.main.async {
                            print("Load -------> ")
                            //self.ecgSamples.append(ecgResults)
                            //self.ecgDates.append(ecgDate)
                            //self.data.append(DataModel(id: i, value: ecgResults, date: ecgDate))
                            let newECG = ECGmodel(id: i, value: ecgResults, date: ecgDate)
                            self.ecg.insert(newECG, at: 0)
                            //self.ecg.append(ECGmodel(id: i, value: ecgResults, date: ecgDate))
                            print("------------------------------------------------------")
                            print(self.ecg[0])
                            counter += 1
                            
                            // el último hilo entrará aquí, lo que significa que todos están terminados
                            if counter == ecgsCount {
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func getECGs(counter: Int, completion: @escaping ([(Double,Double)],Date) -> Void) {
        print("getECGs ----- ")
        var ecgSamples = [(Double,Double)] ()
        let predicate = HKQuery.predicateForSamples(withStart: Date.distantPast,end: Date.distantFuture,options: .strictEndDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let ecgQuery = HKSampleQuery(sampleType: HKObjectType.electrocardiogramType(), predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]){ (query, samples, error) in
            guard let samples = samples,
                  let mostRecentSample = samples.first as? HKElectrocardiogram else {
                return
            }
            //print(mostRecentSample)
            
            
            let query = HKElectrocardiogramQuery(samples[counter] as! HKElectrocardiogram) { (query, result) in
                
                switch result {
                case .error(let error):
                    print("error: ", error)
                    
                case .measurement(let value):
                    let sample = (value.quantity(for: .appleWatchSimilarToLeadI)!.doubleValue(for: HKUnit.volt()) , value.timeSinceSampleStart)
                    ecgSamples.append(sample)
                    
                case .done:
                    //print("done")
                    DispatchQueue.main.async {
                        completion(ecgSamples,samples[counter].startDate)
                    }
                }
            }
            self.healthStore.execute(query)
        }
        
        
        self.healthStore.execute(ecgQuery)
        //print("everything working here")
        //print(ecgSamples.count)
    }
    
    
    func getECGsCount(completion: @escaping (Int) -> Void) {
        var result : Int = 0
        let ecgQuery = HKSampleQuery(sampleType: HKObjectType.electrocardiogramType(), predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil){ (query, samples, error) in
            guard let samples = samples
            else {
                return
            }
            result = samples.count
            completion(result)
            self.ecgTotal = result
        }
        self.healthStore.execute(ecgQuery)
    }
    
    func getTotalECG() -> Int {
        return self.ecgTotal
    }
    
    func getAllECG() -> [ECGmodel] {
        if self.ecg.count > 0 {
            return self.ecg
        }
        return []
    }
    
    /*
    func getDate(titleForRow row: Int) -> String {
        if self.ecg.count < row {
            print("getDate -> \(self.ecg.count)")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy HH:mm"
            let fecha = dateFormatter.string(from: self.ecg[row].date)
            return fecha
        }
        return "Loading..."
    }
    */
}
