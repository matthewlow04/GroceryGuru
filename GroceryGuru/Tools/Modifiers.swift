//
//  Modifiers.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-10-05.
//

import Foundation
import SwiftUI

struct CellModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.gray.opacity(0.10))
            .cornerRadius(20)
            .padding(20)
    }
}


struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .font(.system(size: 20, weight: .heavy, design: .rounded))
            .foregroundStyle(Color.accentColor)
    }
}
