//
//  FridgeView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-04.
//

import SwiftUI

struct FridgeView: View {
    var sortOptions: [SortOption] = [SortOption(name: "Expiry (default)", selected: true), SortOption(name: "Category", selected: false)]
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("Sort by:")
                HStack(){
                    ForEach(sortOptions, id: \.self){ option in
                        Text("\(option.name)")
                            .padding(7)
                            .overlay(Capsule(style: .continuous).stroke(option.selected ? Color.accentColor : Color.gray, lineWidth: 2))
                        
                    }
                }
            }
            .padding(.horizontal, 20)
            FridgeCellView()
            Spacer()
        }
        
    }
} 

struct FridgeView_Previews: PreviewProvider {
    static var previews: some View {
        FridgeView()
    }
}
