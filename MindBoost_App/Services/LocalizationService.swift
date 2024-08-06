//
//  LocalizationService.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import Foundation
import SwiftUI

/// `LocalizationService` manages the language settings and localization for the application.
/// It uses an observable object pattern to react to changes in language settings.
class LocalizationService: ObservableObject {
    /// Shared singleton instance of `LocalizationService`.
    static let shared = LocalizationService(UserRealmStrategy())
    /// User strategy conforming to `UserStrategyProtocol` used to determine initial language settings.
    let userStrategyProtocol: UserStrategyProtocol

    /// Currently selected language, stored in UserDefaults and used to set the app's localization.
    @Published var currentLanguage: String {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: "selectedLanguage")
            Bundle.setLanguage(currentLanguage)
            objectWillChange.send()
        }
    }

    /// Initializes a new instance of `LocalizationService`.
       /// - Parameter userStrategyProtocol: A user strategy object conforming to `UserStrategyProtocol`.
       init(_ userStrategyProtocol: UserStrategyProtocol) {
         self.userStrategyProtocol = userStrategyProtocol
         if let savedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") {
             self.currentLanguage = savedLanguage
         } else {
             let language = userStrategyProtocol.getUser().settings.language
             self.currentLanguage = language?.language ?? "en"
         }
         Bundle.setLanguage(currentLanguage)
     }
}

