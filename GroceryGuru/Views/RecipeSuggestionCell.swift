//
//  RecipeSuggestionCell.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-12.
//

import SwiftUI

struct RecipeSuggestionCell: View {
    @EnvironmentObject var recipeData: RecipeData
    @StateObject var fridge: FridgeData
    var isHomeView: Bool
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                let expiryIngredient = recipeData.recipes.filter { recipe in
                    (recipe.Ingredients?.joined(separator: " ") ?? "").lowercased().contains(fridge.nextToExpire().name.lowercased())
                }
                Text("Recipe Suggestion:")
                if(expiryIngredient.isEmpty){
                    Text("No Suggestions")
                }else{
                    VStack(alignment: .leading){
                        Text(expiryIngredient[0].Name ?? "No Suggestions")
                            .underline()
                            .lineLimit(nil)
                        
                        if(!isHomeView){
                            HStack(spacing: 2){
                                Text("- \(fridge.nextToExpire().name)")
                                   
                                Text("(expires: " + expiresMessage(date: fridge.nextToExpire().expiration) + ")")
                                    .foregroundStyle(fridge.getExpiryColor(date: fridge.nextToExpire().expiration))
                            }
                        }
                       
                        
                    }
                    
                   
                    
                }
                
            }
            if(!isHomeView){
                Spacer()
            }
        }
        
        .padding(20)
        .frame(width: isHomeView ? 180 : 0, height: isHomeView ? 75 : 0)
        .background(Color.accentColor.opacity(0.30))
        .cornerRadius(20)
        .padding(20)
        
       
        
        
    }
}

