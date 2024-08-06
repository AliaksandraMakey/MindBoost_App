//
//  UserSettingDataProtocol.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 03.08.24.
//

import Foundation

/// Defines a protocol for managing application settings.
protocol SettingsProviderStrategyProtocol {
    /// Retrieves the current settings.
    /// - Returns: An instance of `SettingsAppModel`
    func getSettings() -> SettingsAppModel
    /// Saves modifications to user settings.
    /// - Parameter settings: The `SettingsAppModel` instance to save.
    func saveUserSettings(_ settings: SettingsAppModel)
}
