//
//  ListView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack{
            ShoppingListView()
                .modifier(CellModifier())
            Spacer()
        }
      
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

