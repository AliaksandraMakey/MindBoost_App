//
//  ExtensionText.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import SwiftUI

/// Extension to `Text` to create text views with localized content directly.
extension Text {
    /// Initializes a `Text` view with a localized string.
    /// - Parameter localizedKey: The key to localize.
    init(localizedKey: String) {
        self.init(Bundle.localizedString(forKey: localizedKey, value: nil, table: nil))
        print("Localized string for key \(localizedKey): \(Bundle.localizedString(forKey: localizedKey, value: nil, table: nil))")
    }
}
