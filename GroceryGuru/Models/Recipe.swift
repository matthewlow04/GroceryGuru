//
//  Recipe.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import Foundation

struct Recipe: Hashable{
    let name: String
    let url: String
    let author: String
    let ingredients: [String]
    let description: String
    let method: [String]
}



