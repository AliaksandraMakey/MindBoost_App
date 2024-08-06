//
//  SelectionView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import SwiftUI

/// A view that represents an item that can be selected or deselected.
struct SelectableItemView: View {
    /// The title of the item.
    var title: String
    /// A Boolean value indicating whether the item is currently selected.
    var isSelected: Bool

    var body: some View {
        Text(title)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.Accents.num2, lineWidth: isSelected ? 2 : 0)
                    )
            )
            .foregroundColor(isSelected ? Color.Accents.num2 : Color.Accents.num5)
            .padding(.bottom, 10)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
    }
}
