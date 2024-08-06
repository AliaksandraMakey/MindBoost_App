//
//  CategoriesProviderStrategyProtocol.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import Foundation

/// Defines a protocol for providing category information.
protocol CategoriesProviderStrategyProtocol {
    /// Retrieves all available categories.
    /// - Returns: An array of `CategoryAppModel` instances.
    func getAllCategories() -> [CategoryAppModel]
}

