//
//  AffirmationsProviderStrategyProtocol.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import Foundation

/// Defines a protocol for providing affirmations based on categories.
protocol AffirmationsProviderStrategyProtocol {
    /// Retrieves all affirmations for a specific category.
    /// - Parameter category: The category for which affirmations need to be fetched.
    /// - Returns: An array of `AffirmationAppModel` instances.
    func getAllAffirmation(byCategory category: CategoryAppModel) -> [AffirmationAppModel]
}
