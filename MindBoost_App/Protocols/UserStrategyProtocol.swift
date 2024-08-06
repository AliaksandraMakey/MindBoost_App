//
//  UserStrategyProtocol.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 04.08.24.
//

import Foundation

/// Defines a protocol for user management within the app.
protocol UserStrategyProtocol {
    /// Retrieves the current user information.
    /// - Returns: An instance of `User`.
    func getUser() -> User
    
    /// Updates information for the current user.
    /// - Parameter user: The `User` instance with updated information to save.
    func updateUser(_ user: User)
}
