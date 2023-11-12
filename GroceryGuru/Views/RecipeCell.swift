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
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.Name?.capitalized ?? "No Name")
                    .lineLimit(3)
                    .onTapGesture {
                        print(recipe.Ingredients!)
                    }
            }
            .frame(width: 100)

            Image(systemName: recipe.Favourite ? "bookmark.fill" : "bookmark")
                .onTapGesture {
                    recipe.Favourite.toggle()
                    recipeData.toggleFavourite(for: recipe)
                }
               
        }
    }


}



