//
//  Recipe.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import Foundation

struct Recipe: Hashable,Codable {
    var Name: String?
    let url: String?
    let Description: String?
    let Author: String?
    let Ingredients: [String]?
    let Method: [String]?
}


