//
//  RecipeCell.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-04.
//

import SwiftUI

struct RecipeCell: View {
    @EnvironmentObject var recipeData: RecipeData
    @State var recipe: Recipe
    @State var isFavorite = false
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.Name?.capitalized ?? "No Name")
                    .lineLimit(3)
            }
            .frame(width: 100)

            Image(systemName: isFavorite ? "bookmark.fill" : "bookmark")
                .onTapGesture {
                    isFavorite.toggle()
                    toggleFavorite()
                }
               
        }
    }
    
    func toggleFavorite() {
        
        if isFavorite {
            recipeData.favorites.append(recipe)
        } else {
            recipeData.favorites.removeAll { $0 == recipe }
        }
        
        print(recipeData.favorites)
    }
}



