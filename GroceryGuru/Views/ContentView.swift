//
//  ContentView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack(spacing: 0){
                Text("Grocery")
                    .foregroundStyle(CustomColor.darkGreen)
                Text("Guru")
                    .foregroundStyle(CustomColor.titleBrown)
            }
            .font(Font.system(size: 30, design: .serif))
            .bold()
            
            Divider()
            TabView{
                HomeView()
                    .tabItem{Label("Home", systemImage: "house")}
                ListView()
                    .tabItem{Label("List", systemImage: "checklist")}
                FridgeView()
                    .tabItem{Label("Fridge", systemImage: "refrigerator")}
                RecipeView()
                    .tabItem{Label("Recipes", systemImage: "fork.knife")}
            }
        }
        .font(Font.system(size: 15, weight: .semibold, design:.rounded))
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
