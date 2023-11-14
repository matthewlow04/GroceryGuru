//
//  ListView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import SwiftUI

struct ListView: View {
    @StateObject var shoppingList: ShoppingListData
    var body: some View {
        VStack{
            ShoppingListView(shoppingList: shoppingList)
                .modifier(CellModifier())
            Spacer()
        }
      
    }
}



