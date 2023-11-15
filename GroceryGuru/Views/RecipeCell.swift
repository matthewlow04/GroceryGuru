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
    @State var showingPopover = false
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: recipe.imageUrl!)) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 100)
     

            HStack{
                VStack(alignment: .leading, spacing: 4) {
                    Text(recipe.Name?.capitalized ?? "No Name")
                        .lineLimit(3)
                        .padding(.horizontal, 2)
                }
                Spacer()

                Image(systemName: recipe.Favourite ? "bookmark.fill" : "bookmark")
                    .onTapGesture {
                        recipe.Favourite.toggle()
                        recipeData.toggleFavourite(for: recipe)
                    }
                    .padding(.horizontal, 2)
                   
            }
            .frame(width: 125, height: 75)
            
        }
        .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color.gray.opacity(0.2)))
        .onTapGesture {
            showingPopover = true
        }
        
        .popover(isPresented: $showingPopover, content: {
            RecipeDetailView(recipe: recipe)
        })
       
    }


}



