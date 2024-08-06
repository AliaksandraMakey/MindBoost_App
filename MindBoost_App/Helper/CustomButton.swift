//
//  CustomButton.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import SwiftUI

/// A custom styled button used throughout the application to continue user actions.
struct CustomContinueButton: View {
    /// The action to perform when the button is tapped.
    var action: () -> Void
    /// The localization key for the button's title.
    var titleKey: String

    var body: some View {
        Button(action: action) {
            Text(localizedKey: titleKey)
                .padding()
                .background(Color.Accents.num2)
                .foregroundColor(.black)
                .cornerRadius(10)
        }
        .padding(.top, 20)
        .padding(.horizontal, Device.iPhone ? 20 : 40)
    }
}
