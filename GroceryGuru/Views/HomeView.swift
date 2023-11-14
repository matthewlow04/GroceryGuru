//
//  HomeView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    @StateObject var fridge: FridgeData
    @StateObject var shoppingList: ShoppingListData
    var body: some View {
        ScrollView{
            VStack(spacing: -20){
                ShoppingListView(shoppingList: shoppingList)
                    .modifier(CellModifier())
                ZStack{
                    FridgeCellView(fridge: fridge, isHomeScreen: true)
                    RecipeSuggestionCell(fridge: fridge, isHomeView: true)
                        .offset(x: 75, y: -50)
                }
                
                NearbyView()
                    .modifier(CellModifier())
                    
            }
        }
       
     
    }
}

