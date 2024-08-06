//
//  AppCoordinatorProtocol.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import SwiftUI

/// Defines a protocol for the application coordinator responsible for managing the app's lifecycle and navigation.
protocol AppCoordinatorProtocol: ObservableObject {
    /// Starts the coordinator.
    func start()
}
