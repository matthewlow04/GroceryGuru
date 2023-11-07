//
//  Capitalize.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-04.
//

import Foundation

extension String{
    func capitalizeFirstLetterOfEachWord(_ input: String) -> String {
        let words = input.components(separatedBy: " ")
        let capitalizedWords = words.map { $0.capitalized }
        return capitalizedWords.joined(separator: " ")
    }
}
