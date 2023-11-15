//
//  FridgeCellView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-06.
//

import SwiftUI
import Sliders

struct FridgeCellView: View {
    @StateObject var fridge: FridgeData
    @State var showingPopover = false
    var isHomeScreen: Bool

    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text("My Fridge")
                        .modifier(TitleModifier())
                    Spacer()
                    if(!isHomeScreen){
                        Button(action: {
                            showingPopover = true
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
                .popover(isPresented: $showingPopover, content: {
                    AddFoodView(fridge: fridge)
                })
              
                ForEach($fridge.fridgeItems, id: \.self) { $food in
                    ZStack{
                        if(!isHomeScreen){
                            ValueSlider(value: $food.amount,in: 0...1, step: 0.05)
                                .valueSliderStyle(
                                    HorizontalValueSliderStyle(
                                                track:
                                                    HorizontalValueTrack(
                                                        view: RoundedRectangle(cornerRadius: 10).foregroundColor(fridge.getExpiryColor(date: food.expiration).opacity(0.5)),
                                                        mask: RoundedRectangle(cornerRadius: 10).foregroundColor(fridge.getExpiryColor(date: food.expiration).opacity(0.5))
                                                    )
                                                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white))
                                                    .frame(height: 50),
                                                thumbSize: CGSizeMake(1, 1),
                                                options: .interactiveTrack
                                    )
                                )
                        }
                        HStack{
                            VStack (alignment: .leading) {
                                Text(food.name)
                                Text("Expires: " + expiresMessage(date: food.expiration))
                                    .foregroundColor(fridge.getExpiryColor(date: food.expiration))
                                    .font(Font.system(size: 13, weight: .semibold))
                            }
                            Spacer()
                        }
                        .padding(.horizontal, isHomeScreen ? 0 : 10)
                    
                        
                        
                    }
                    .frame(height: isHomeScreen ? 35 : 50)
                   
                }
            }
        }
        .padding(20)
        .modifier(CellModifier())
        
       
    }
}



