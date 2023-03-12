//
//  ECGmodel.swift
//  UCMheart
//
//  Created by Andres Felipe Yunda Castillo on 4/2/23.
//

import Foundation
import HealthKit

struct ECGmodel {
    
    let id: Int
    let value: [(A: Double,B: Double)]
    let date: Date
    let frec_cardiaca: Int
    let classification: String

    init(id: Int, value: [(A: Double, B: Double)], date: Date, frec_cardiaca: Int, classification: String) {
        self.id = id
        self.value = value
        self.date = date
        self.frec_cardiaca = frec_cardiaca
        self.classification = classification
    }
    
    
}


