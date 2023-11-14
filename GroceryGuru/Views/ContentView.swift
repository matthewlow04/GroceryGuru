//
//  ContentView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-03.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var recipeData: RecipeData
    @EnvironmentObject var locationManager: LocationManager
    @StateObject var fridgeData = FridgeData()
    @StateObject var shoppingList = ShoppingListData()
    @State private var clLocationManager = CLLocationManager()

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
                HomeView(fridge: fridgeData, shoppingList: shoppingList)
                    .tabItem{Label("Home", systemImage: "house")}
                ListView(shoppingList: shoppingList)
                    .tabItem{Label("List", systemImage: "checklist")}
                FridgeView(fridge: fridgeData)
                    .tabItem{Label("Fridge", systemImage: "refrigerator")}
                RecipeView(fridge: fridgeData)
                    .tabItem{Label("Recipes", systemImage: "fork.knife")}
            }
            
            
        }
        .font(Font.system(size: 15, weight: .semibold, design:.rounded))
        .onAppear{
           
            recipeData.loadRecipesFromJSONFile(named: "christmasrecipes")
//            CLLocationManager().requestWhenInUseAuthorization()
            fridgeData.sortDefault()
        }
        
    }
    
   
}




