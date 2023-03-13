//
//  DetalleECG.swift
//  UCMheart
//
//  Created by Andres Felipe Yunda Castillo on 12/3/23.
//

import SwiftUI
import Charts

struct DetalleECG: View {
    
    var ecg: ECGmodel
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading){
            VStack{
                Text(ecg.classification).font(.title.bold().italic())
                HStack(alignment: .firstTextBaseline){
                    Text(ecg.date, style: .date).font(.subheadline)
                    Text(ecg.date, style: .time).font(.subheadline)
                }
            }
            
            Grafica(ecgValue: ecg.value)
            
            HStack{
                Image(systemName: "suit.heart.fill").foregroundColor(.red)
                Text("\(String(ecg.frec_cardiaca)) LPM de media").font(.subheadline)
            }
        }
        .padding(.top,50)
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
    
        
    }
    
}

struct DetalleECG_Previews: PreviewProvider {
    static var previews: some View {
        DetalleECG(ecg: ECGmodel(id: 0, value: [(A: 0, B: 0)], date: Date.now, frec_cardiaca: 0, classification: ""))
    }
}
