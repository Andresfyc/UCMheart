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
            }
        }
        .listStyle(SidebarListStyle())
    }
}


struct Resultados_Previews: PreviewProvider {
    static var previews: some View {
        Resultados()
    }
}
