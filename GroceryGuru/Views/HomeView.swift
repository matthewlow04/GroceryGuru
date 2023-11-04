//
//  HomeView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(){
            ShoppingListView()
                .modifier(CellModifier())
            FridgeCellView()
                
        }
     
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
