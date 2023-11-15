//
//  AddFoodView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-15.
//

import SwiftUI

struct AddFoodView: View {
    @StateObject var fridge: FridgeData
    @State var name = ""
    @State var category = ""
    @State var expiryDate = Date.now
    @State var showingAlert = false
    @State var alertMessage = ""
    @Environment(\.dismiss) var dismiss
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack{
                Spacer()
                Text("Add Food")
                    .font(Font.system(size: 40, weight: .bold))
                    .padding(.bottom, 20)
                    .foregroundStyle(Color.accentColor)
                Spacer()
            }
         
            Section{
                TextField("Enter Food Name", text: $name)
            }header: {
                Text("Food Name")
            }
            Section{
                LazyVGrid(columns: columns, content: {
                    ForEach(FridgeFood.Category.allCases, id: \.self){ cat in
                        Button(cat.rawValue.capitalized){
                            category = cat.rawValue
                        }
                        .foregroundStyle(category == cat.rawValue ? Color.accentColor : Color.gray)
                        .padding(.vertical)
                        
                    }
                    
                })
            }header: {
                Text("Food Category")
            }
            Section{
                HStack{
                    Spacer()
                    DatePicker("Expiry Date", selection: $expiryDate, displayedComponents: [.date])
                           .datePickerStyle(WheelDatePickerStyle())
                           .labelsHidden()
                    Spacer()
                }
               
            }header:{
                Text("Select Expiry Date")
            }
            HStack{
                Spacer()
                Button("Add Food"){
                    
                    if(category.isEmpty){
                        alertMessage = "Pick a category"
                        showingAlert = true
                        return
                    }
                    
                    if(!isAlphabetic(name)){
                        alertMessage = "Enter a valid food name"
                        showingAlert = true
                        return
                    }
                    if(expiryDate < Date.now){
                        alertMessage = "You can't add an expired item"
                        showingAlert = true
                        return
                    }
                    let sortOption = fridge.sortOptions.filter{$0.selected == true}
                    fridge.fridgeItems.append(FridgeFood(name: name, expiration: expiryDate, category: FridgeFood.Category(rawValue: category) ?? .other, amount: 1))
                    fridge.sortFridge(sortOption[0].name)
                    dismiss()
                }
                .padding(7)
                .overlay(Capsule(style: .continuous).stroke(Color.accentColor, lineWidth: 2))
                Spacer()
            }
           
        }
        .alert(alertMessage, isPresented: $showingAlert, actions: {
            Button("OK", role: .cancel){}
        })
        .padding(.horizontal, 20)
    }
    func isAlphabetic(_ s: String) -> Bool {
        return !s.isEmpty && s.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
    }
}
