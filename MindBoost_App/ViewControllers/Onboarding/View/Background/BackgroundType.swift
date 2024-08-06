//
//  BackgroundType.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import SwiftUI

enum BackgroundType: String, Codable {
    // MARK: - Cases
    case blueBackground = "blue_background"
    case redBackground = "red_background"
    case none = "white"

    // MARK: - Computed Properties
    /// Returns an `Image` view corresponding to the background type.
    var image: Image {
        return Image(self.rawValue)
    }
    /// Provides the file name of the image associated with the background type.
    var imageName: String {
        switch self {
        case .blueBackground:
            return "blue_background"
        case .redBackground:
            return "red_background"
        default:
            return "white"
        }
    }
}
