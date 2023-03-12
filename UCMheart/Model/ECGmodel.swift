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

    init(id: Int, value: [(A: Double, B: Double)], date: Date) {
        self.id = id
        self.value = value
        self.date = date
    }
    
    
    
}


