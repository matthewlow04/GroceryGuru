//
//  RecipeCell.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-04.
//

import SwiftUI

struct RecipeCell: View {
    var recipe: Recipe
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(recipe.name)
                Text(recipe.author)
            }

            Image(systemName: "bookmark")
               
        }
    }
}



