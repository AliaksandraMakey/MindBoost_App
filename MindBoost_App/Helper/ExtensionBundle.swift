//
//  ExtensionBundle.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import SwiftUI

/// Extension to `Bundle` to manage localization resources based on the selected language.
extension Bundle {
    /// Private static variable to hold the localized bundle.
    private static var bundle: Bundle?
    /// Sets the current language of the app by changing the main bundle to a localized version.
    /// - Parameter language: The language code to set the app to.
    static func setLanguage(_ language: String) {
        if let path = Bundle.main.path(forResource: language, ofType: ".lproj") {
            bundle = Bundle(path: path)
        } else {
            bundle = Bundle.main
        }
        print("Language set to \(language), bundle path: \(String(describing: path))")
    }
    /// Returns a localized string for a given key.
       /// - Parameters:
       ///   - key: The key for the localized string.
       ///   - value: The default string to use if the key is not found.
       ///   - tableName: The table containing the localization data.
       /// - Returns: The localized string.
        static func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        return bundle?.localizedString(forKey: key, value: value, table: tableName) ?? key
    }
}

