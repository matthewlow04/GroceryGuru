//
//  FridgeFood.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-06.
//

import Foundation


struct FridgeFood: Hashable {
    var name: String
    var expiration: Date
    var category: Category
    var amount: Double
    enum Category: String, CaseIterable, Codable{
        case dairy = "dairy"
        case meat = "meat"
        case fruit = "fruit"
        case veg = "vegetable"
        case grains = "grains"
        case other = "other"
    }
}
