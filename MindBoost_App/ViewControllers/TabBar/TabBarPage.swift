//
//  TabBarPage.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import SwiftUI

// MARK: - TabBarPage Enum
enum TabBarPage: String, CaseIterable {
    case categorie
    case allAffirmations
    case favoriteAffirmations
    case userSettings
    // MARK: - Properties
    /// Localized name for each tab based on its raw value.
    var localizedName: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    /// System image name associated with each tab.
    var systemImage: String {
        switch self {
        case .categorie:
            return "list.bullet"
        case .allAffirmations:
            return "text.quote"
        case .favoriteAffirmations:
            return "star.fill"
        case .userSettings:
            return "gearshape"
        }
    }
    
}
