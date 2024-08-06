//
//  UserBackgroundAppModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 04.08.24.
//

import Foundation
import SwiftUI

struct BackgroundAppModel: Identifiable, Codable {
    var id: String
    var identityCode: String
    var backgroundType: BackgroundType
}
