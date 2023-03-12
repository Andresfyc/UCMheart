//
//  DetalleECG.swift
//  UCMheart
//
//  Created by Andres Felipe Yunda Castillo on 12/3/23.
//

import SwiftUI
import Charts

private struct ViewConstants {
    static let color_ = Color(.red)
        static let minYScale = 0
        static let maxYScale = 350
        static let chartWidth: CGFloat = 350
        static let chartHeight: CGFloat = 400
        static let escalaData: CGFloat = 0.25
}

struct DetalleECG: View {
    
    var ecg: ECGmodel
    
    var body: some View {
        Text(String(ecg.frec_cardiaca))
        Text(ecg.classification)
        Label("grafica ECG", systemImage: "sensor.fill").font(.system(size: 20))
        ScrollView(.horizontal) {
            Chart {
                ForEach(Array(ecg.value.enumerated()), id: \.offset) { index, value in
                    LineMark(
                        x: .value("A", value.1),
                        y: .value("B", value.0)
                    )
                    .foregroundStyle(ViewConstants.color_)
                }
            }
            .chartYAxis(.hidden)
            .chartYAxis() {
                AxisMarks(position: .automatic)
            }
            .frame(width: ViewConstants.escalaData * CGFloat(ecg.value.count))
        }
        .frame(width: ViewConstants.chartWidth,  height: ViewConstants.chartHeight)
        .padding()
    }
}

struct DetalleECG_Previews: PreviewProvider {
    static var previews: some View {
        DetalleECG(ecg: ECGmodel(id: 0, value: [(A: 0, B: 0)], date: Date.now, frec_cardiaca: 0, classification: ""))
    }
}
