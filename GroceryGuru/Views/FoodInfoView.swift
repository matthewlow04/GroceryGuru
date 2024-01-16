//
//  FoodInfoView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-15.
//

import SwiftUI

struct FoodInfoView: View {
    @State var food: ShoppingFood
    var body: some View {
        Text(food.name)
    }
}
