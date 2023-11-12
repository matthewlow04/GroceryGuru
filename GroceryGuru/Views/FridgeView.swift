//
//  FridgeView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import SwiftUI

struct FridgeView: View {
    
    @StateObject var fridge: FridgeData
    var body: some View {
        VStack(alignment: .leading){
            RecipeSuggestionCell(fridge: fridge, isHomeView: false)
            VStack(alignment: .leading){
                Text("Sort by:")
                HStack(){
                    ForEach(fridge.sortOptions, id: \.self){ option in
                        Button {
                            fridge.sortFridge(option.name)
                        } label: {
                            Text("\(option.name)")
                                .foregroundStyle(option.selected ? Color.accentColor : Color.black)
                                .padding(7)
                                .overlay(Capsule(style: .continuous).stroke(option.selected ? Color.accentColor : Color.gray, lineWidth: 2))
                        }
          
                    }
                }
            }
            .padding(.horizontal, 20)
            FridgeCellView(fridge: fridge, isHomeScreen: false)
            Spacer()
        }
        
        
       
    }
    
   
}


