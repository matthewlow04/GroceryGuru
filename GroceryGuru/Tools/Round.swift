//
//  Round.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-06.
//

import Foundation

extension Double {
    func rounded(toDecimalPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
