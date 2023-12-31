//
//  GroceryGuruApp.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-03.
//

import SwiftUI

@main
struct GroceryGuruApp: App {
    @StateObject var recipeData = RecipeData()
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeData)
                .environmentObject(locationManager)
        }
    }
}

