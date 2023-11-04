//
//  FridgeCellView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-06.
//

import SwiftUI

struct FridgeCellView: View {
    @State var fridgeItems = [FridgeFood(name: "Mushroom", expiration: Date.now, category: FridgeFood.Category.dairy)]
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10) {
                Text("My Fridge")
                    .modifier(TitleModifier())
                ForEach($fridgeItems, id: \.self) { $food in
                    VStack (alignment: .leading) {
                        Text(food.name)
                        Text("Expires Today")
                            .foregroundColor(CustomColor.expiryBlue)
                    }
                }
            }
            Spacer()
        }
        .padding(20)
        .modifier(CellModifier())
       
    }
}

struct FridgeCellView_Previews: PreviewProvider {
    static var previews: some View {
        FridgeCellView()
    }
}
