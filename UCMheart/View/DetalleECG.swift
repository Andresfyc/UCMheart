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
        //Text(String(ecg.id))
        Label("grafica ECG", systemImage: "sensor.fill").font(.system(size: 20))
        Chart {
            ForEach(Array(ecg.value.enumerated()), id: \.offset) { index, value in
                LineMark(
                    x: .value("A", value.1),
                    y: .value("B", value.0)
                        )
                }
        }
        .frame(height: 250)
        .foregroundStyle(.red)
        
        
    }
}

struct DetalleECG_Previews: PreviewProvider {
    static var previews: some View {
        DetalleECG(ecg: ECGmodel(id: 0, value: [(A: 0, B: 0)], date: Date.now))
    }
}
