//
//  ShoppingListView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import SwiftUI
struct ShoppingListView: View {
    
    @State var addingItem = false
    @State var itemName = ""
    @StateObject var shoppingList: ShoppingListData
    @State var showingPopover = false
    @State var selectedFood: ShoppingFood?

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("My Shopping List")
                    .modifier(TitleModifier())
                
                ForEach($shoppingList.foodItems, id: \.self) { $food in
                    HStack {
                        CheckBox(foodItem: $food)
                        Text(food.name)
                            .onTapGesture {
                                selectedFood = food
                            }
                            .onChange(of: selectedFood) { 
                                showingPopover = true
                            }
                    }
                    
                }

                if !addingItem {
                    Button {
                        addingItem.toggle()
                    } label: {
                        HStack {
                            ZStack {
                                Image(systemName: "circle")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Image(systemName: addingItem ? "minus" : "plus")
                                    .resizable()
                                    .frame(width: 13, height: 13)
                            }
                            Text("Add Item")
                        }
                    }
                } else {
                    HStack {
                        TextField("Enter item name", text: $itemName)
                        Spacer()
                        Button("Add") {
                            if !itemName.isEmpty {
                                shoppingList.foodItems.append(ShoppingFood(name: itemName, selected: false))
                                itemName = ""
                                addingItem.toggle()
                            }
                        }
                        .disabled(itemName.isEmpty)
                        Button("Back"){
                            addingItem.toggle()
                        }
                       
                    }
                }
            }
            .popover(isPresented: $showingPopover, arrowEdge: Edge.top, content: {
                FoodInfoView(food: selectedFood!)
                    .presentationCompactAdaptation((.popover))
            })
            Spacer()
        }
        .padding(.all, 20)
    }
}


struct CheckBox: View{
    @Binding var foodItem: ShoppingFood
    var body: some View{
        Button(action: {
            foodItem.selected.toggle()
        }) {
            Image(systemName: !foodItem.selected ? "circle" : "checkmark.circle")
                .resizable()
                .frame(width:25, height:25)
        }
    }
}



