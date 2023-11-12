//
//  RecipeData.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-04.
//

import Foundation

class RecipeData: ObservableObject{
    @Published var recipes: [Recipe] = []
    @Published var favorites: [Recipe] = []
    
    func loadRecipesFromJSONFile(named filename: String) {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("File \(filename).json not found.")
        }

        do {
            let data = try Data(contentsOf: fileURL)
            recipes = try JSONDecoder().decode([Recipe].self, from: data)
        } catch {
            fatalError("Error decoding JSON: \(error)")
        }
    }
    
    func fetchRecipesWithExpiringIngredient(food: String) -> [Recipe]{
        let recipes = recipes.filter{$0.Ingredients!.contains(food)}
        
        return recipes
    }
    
    func toggleFavourite(for recipe: Recipe) {
            if recipe.Favourite {
                if !favorites.contains(recipe) {
                    favorites.append(recipe)
                }
            } else {
                favorites.removeAll { $0 == recipe }
            }
        
        objectWillChange.send()
    }
}
