//
//  HomeView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        ScrollView{
            VStack(){
                ShoppingListView()
                    .modifier(CellModifier())
                FridgeCellView()
                NearbyView()
                    .modifier(CellModifier())
                    
            }
        }
       
     
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
