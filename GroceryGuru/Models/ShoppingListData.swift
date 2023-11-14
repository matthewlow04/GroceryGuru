//
//  ShoppingListData.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-12.
//

import Foundation

class ShoppingListData: ObservableObject{
    @Published var foodItems = [ShoppingFood(name: "Apple", selected: true), ShoppingFood(name: "Orange", selected: false)]
}
