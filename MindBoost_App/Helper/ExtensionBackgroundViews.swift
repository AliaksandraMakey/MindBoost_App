//
//  ExtensionBackgroundViews.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import SwiftUI

/// Provides an extension to any `View` to apply custom frame and background settings.
extension View {
    /// Applies a pre-defined frame size and background styling to the view.
    /// - Returns: A view modified with custom frame, background, and shadow properties.
    func customFrameAndBackground() -> some View {
        self
            .frame(width: Device.iPhone ? 300 : 400, height: 500, alignment: .center)
            .background(Color.Accents.num3)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}
