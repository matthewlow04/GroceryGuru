//
//  RecipeView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import SwiftUI

struct RecipeView: View {
    var recipes = [Recipe(name: "Pork", url: "", author: "Matthew Low", ingredients: [], description: "", method: [])]
    var body: some View {
        HStack{
            ForEach(recipes, id: \.self){ recipe in
                RecipeCell(recipe: recipe)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
