//
//  FridgeData.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-08.
//

import Foundation
import SwiftUI

class FridgeData: ObservableObject{
    @Published var fridgeItems = [
        FridgeFood(name: "Tomato", expiration: Date.now, category: .veg, amount: 0.5),
        FridgeFood(name: "Apple", expiration: setDate(month: 09, day: 21, year: 2023), category: .fruit, amount: 0.3),
        FridgeFood(name: "Pork", expiration: setDate(month: 10, day: 08, year: 2024), category: .meat, amount: 0.2)
    ]
    
    var indexOfCurrentOption = 0
    var sortOptions: [SortOption] = [SortOption(name: "Expiry (default)", selected: true), SortOption(name: "Category", selected: false), SortOption(name: "Alphabetical", selected: false)]
    
    func sortDefault(){
        fridgeItems.sort{$0.expiration < $1.expiration}
    }
    
    func getExpiryColor(date: Date) -> Color{
        let minutes = Int(date.timeIntervalSinceNow)/60
        let hours = minutes/60
        
        if(hours < 48){
            return Color.red
        }
        else if(hours < 7*24){
            return CustomColor.expiryYellow
        }else{
            return CustomColor.expiryBlue
        }
        
    }
    
    func sortFridge(_ sortOption: String){
        if(sortOption == "Expiry (default)"){
            fridgeItems.sort{$0.expiration < $1.expiration}
            toggleSelected(index: 0)
        }else if(sortOption == "Category"){
            fridgeItems.sort{$0.category.rawValue < $1.category.rawValue}
            toggleSelected(index: 1)
        }else if(sortOption == "Alphabetical"){
            fridgeItems.sort{$0.name < $1.name}
            toggleSelected(index: 2)
        }
    }
    
    func nextToExpire() -> FridgeFood{
        var fridgeItemsDuplicate = fridgeItems
        fridgeItemsDuplicate.sort{$0.expiration < $1.expiration}
        return fridgeItemsDuplicate[0]
    }
    
    func toggleSelected(index: Int){
        sortOptions[indexOfCurrentOption].selected.toggle()
        sortOptions[index].selected.toggle()
        indexOfCurrentOption = index
    }
}
