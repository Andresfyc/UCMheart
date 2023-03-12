//
//  Resultados.swift
//  UCMheart
//
//  Created by Andres Felipe Yunda Castillo on 4/12/22.
//

import SwiftUI
import Charts


struct Resultados: View {
    
    @StateObject var ecgViewModel = ECGViewModel()
    @State var dateFormatter = DateFormatter()
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationView{
                    List {
                        ForEach(ecgViewModel.ecg, id: \.id) { ecg in
                            NavigationLink(destination: DetalleECG(ecg: ecg)) {
                                HStack{
                                    Text(ecg.date, style: .date)
                                    Text(ecg.date, style: .time)
                                }
                            }
                            
                        }
                        .navigationTitle("ECG's")
                    }
                }
                
                //Label("grafica ECG", systemImage: "sensor.fill").font(.system(size: 20))
                
                //Grafica()
                //Text(String(ecgViewModel.getAllECG().count))

                /*
                Chart {
                    ForEach(Array(viewModel.getData(Select: 0).enumerated()), id: \.offset) { index, value in
                        LineMark(
                            x: .value("A", value.1),
                            y: .value("B", value.0)
                                )
                        }
                }
                
                 Chart { data in
                     ForEach(Array(data.value.enumerated()), id: \.offset) { A, B in
                     LineMark(
                         x: .value("A", B.1),
                         y: .value("B", B.0))
                     }
                 }
                 */
                 
               
                
            }
        //x: ecgSamples[i].1, y: ecgSamples[i].0)
        }
        .listStyle(SidebarListStyle())
            .onAppear() {
                //print("1")
                //ecgViewModel.load()
            }
    }
}


struct Resultados_Previews: PreviewProvider {
    static var previews: some View {
        Resultados()
    }
}
