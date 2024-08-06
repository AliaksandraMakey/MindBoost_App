//
//  OnboardingPageEnum.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import SwiftUI
// MARK: - OnboardingPage Enum
enum OnboardingPage: CaseIterable {
    case name
    case category
    case gender
    case language
    case background
    // MARK: - Order Property
    /// Represents the sequential order of each onboarding page.
    var order: Int {
        switch self {
        case .name: return 1
        case .category: return 2
        case .gender: return 3
        case .language: return 4
        case .background: return 5
        }
    }
    // MARK: - Helper Method
        /// Returns the `OnboardingPage` corresponding to a given order.
        /// - Parameter order: The order number of the page.
        /// - Returns: An `OnboardingPage` enum case.
    static func page(for order: Int) -> OnboardingPage {
        return self.allCases.first { $0.order == order } ?? .name
        }
}
