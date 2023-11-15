//
//  RecipeDetailView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-14.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: recipe.imageUrl!)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }

  
                Text(recipe.Name ?? "Unnamed Recipe")
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                
    
                Text("Author: \(recipe.Author ?? "")")
                    .padding(.horizontal)

          
                Text(recipe.Description ?? "")
                    .foregroundColor(.secondary)
                    .padding(.horizontal)


                Section(header: Text("Ingredients").font(.headline).padding(.horizontal)) {
                    ForEach(recipe.Ingredients!, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                    .padding(.horizontal)
                    .foregroundColor(.secondary)
                }


                Section(header: Text("Instructions").font(.headline).padding(.horizontal)) {
                    ForEach(Array(recipe.Method!.enumerated()), id: \.self.1) { index, step in
                        Text("\(index + 1). \(step)")
                            .padding(.horizontal)
                            .foregroundColor(.secondary)
                    }
                }





                Link("View Recipe", destination: URL(string: recipe.url!)!)
                    .padding(.horizontal)
            }
        }
        .onAppear(perform: {
            print(recipe)
        })
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe(Name: "Cupcake", url: "http://google.ca", Description: "Vanilla cupcakes meant for all occasions", Author: "Matthew Low", Ingredients: ["butter", "sugar", "sprinkles", "flour", "egg"], Method: ["asdfasdfas", "asdfasdfasdfasdf", "awdfdasfasfsad"], Favourite: false, imageUrl: "https://images.immediate.co.uk/production/volatile/sites/30/2008/01/Christmas-pie-2ed9223.jpg?quality=90&webp=true&resize=600,545"))
            .preferredColorScheme(.light)
    }
}


#Preview {
    RecipeDetailView(recipe: Recipe(Name: "Cupcake",url: "http://google.ca", Description: "Vanilla cupcakes meant for all occasions", Author: "Matthew Low", Ingredients: ["butter", "sugar", "sprinkles", "flour", "egg"], Method: ["asdfasdfas", "asdfasdfasdfasdf", "awdfdasfasfsad"], Favourite: false, imageUrl: "https://images.immediate.co.uk/production/volatile/sites/30/2008/01/Christmas-pie-2ed9223.jpg?quality=90&webp=true&resize=600,545"))
}
