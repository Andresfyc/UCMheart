//
//  Grafica.swift
//  UCMheart
//
//  Created by Andres Felipe Yunda Castillo on 11/3/23.
//

import SwiftUI
import Charts

let data = [(A: -2.967403984069824e-05, B: 0.0), (A: -5.108494567871093e-05, B: 0.001953125),
            (A: -1.7164798736572265e-05, B: 0.00390625), (A: 7.068367767333984e-05, B: 0.005859375),
            (A: 0.00019779476928710935, B: 0.0078125), (A: 0.00033962213134765626, B: 0.009765625) ]

struct Grafica: View {
   
    //@StateObject private var viewModel = ViewModel()
    
    var body: some View {
        Text("HOLA MUNDO")
        
        Chart {
            ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                LineMark(
                    x: .value("A", value.1),
                    y: .value("B", value.0)
                        )
                }
        }
        /*
        Chart(viewModel.getECG()) { data in
            ForEach(Array(data.value.enumerated()), id: \.offset) { index, value in
                LineMark(
                    x: .value("A", value.1),
                    y: .value("B", value.0)
                        )
                }
        }*/
         
    }
         
}

struct Grafica_Previews: PreviewProvider {
    static var previews: some View {
        Grafica()
    }
}
