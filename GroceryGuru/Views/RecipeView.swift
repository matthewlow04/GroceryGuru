//
//  RecipeView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import SwiftUI

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var recipeData: RecipeData

    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Try New Foods")
                    .font(.headline)
                Text("Random Recommendations")
                    .font(.subheadline)
                    .opacity(0.8)
                ScrollView(.horizontal){
                    HStack {
                        ForEach(recipeData.recipes, id: \.self) { recipe in
                            RecipeCell(recipe: recipe)
                                .padding()
                        }
                    }
                }
            }
            
            VStack(alignment: .leading){
                HStack{
                    VStack{
                        Text("Personalized Recipe Ideas")
                            .font(.headline)
                        Text("Recipes that use 'Mushrooms'")
                            .font(.subheadline)
                            .opacity(0.8)
                    }
                    Spacer()
                    Text("View All")
                    Image(systemName: "play")
                }
                let recipesWithTomato = recipeData.recipes.filter { recipe in
                    return recipe.Ingredients?.contains(where: { ingredient in
                        return ingredient.lowercased().contains("tomato")
                    }) ?? false
                }
                if !recipesWithTomato.isEmpty {
                    Text("No Suggestions")
                        .padding(.top, 20)
                        .italic()
                        .opacity(0.8)
                        .font(Font.system(size: 20))
                        .frame(maxWidth: .infinity)

                } else {
                    ScrollView(.horizontal){
                        HStack {
                            ForEach(recipesWithTomato, id: \.self) { recipe in
                                RecipeCell(recipe: recipe)
                                    .padding()
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 10)
            VStack(alignment: .leading){
                HStack{
                    Text("My Saved Recipes")
                        .font(.headline)
                    Spacer()
                    Text("View All")
                    Image(systemName: "play")
                }
                if(recipeData.favorites.isEmpty){
                    
                    Text("No Favourites")
                        .padding(.top, 20)
                        .italic()
                        .opacity(0.8)
                        .font(Font.system(size: 20))
                        .frame(maxWidth: .infinity)

                }
                else{
                    ScrollView(.horizontal){
                        HStack {
                            ForEach(recipeData.favorites, id: \.self) { recipe in
                                RecipeCell(recipe: recipe)
                                    .padding()
                            }
                        }
                    }
                }
                
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 20)
       
        
      
        .onAppear {
            recipeData.recipes.shuffle()
        }
    }

    
}



