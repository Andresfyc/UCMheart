//
//  Grafica.swift
//  UCMheart
//
//  Created by Andres Felipe Yunda Castillo on 11/3/23.
//

import SwiftUI
import Charts

private struct ViewConstants {
    static let color_ = Color(.red)
        static let chartWidth: CGFloat = 350
        static let chartHeight: CGFloat = 400
        static let escalaData: CGFloat = 0.25
}

struct Grafica: View {
   
    var ecgValue: [(A: Double,B: Double)]
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading){
            ScrollView(.horizontal) {
                Chart {
                    ForEach(Array(ecgValue.enumerated()), id: \.offset) { index, value in
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
                .frame(width: ViewConstants.escalaData * CGFloat(ecgValue.count))
            }
            .frame(width: ViewConstants.chartWidth,  height: ViewConstants.chartHeight)
        }
        .padding(.top,10 )
        .padding(.bottom,10)
    }
         
}

struct Grafica_Previews: PreviewProvider {
    static var previews: some View {
        Grafica(ecgValue: [(A: 0,B: 0)])
    }
}
