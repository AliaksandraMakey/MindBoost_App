//
//  BackgroundView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import SwiftUI

struct BackgroundView: View {
    // MARK: - Properties
    var background: BackgroundAppModel
    var isSelected: Bool
    // MARK: - Body
    var body: some View {
        if let userBackground = background as? BackgroundAppModel {
            userBackground.backgroundType.image
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: isSelected ? 2 : 0)
                )
                .padding(.bottom, 10)
        } else {
            Color.white
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: isSelected ? 2 : 0)
                )
                .padding(.bottom, 10)
        }
    }
}
