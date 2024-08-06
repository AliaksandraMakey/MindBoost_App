//
//  UserAppModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 03.08.24.
//

import Foundation

struct User: Identifiable {
    var id: String
    var name: String
    var isOnboarded: Bool
    var settings: UserSettingsAppModel
    var favoriteAffirmations: [AffirmationAppModel] = []

    init(id: String, name: String, isOnboarded: Bool, settings: UserSettingsAppModel, favoriteAffirmations: [AffirmationAppModel] = []) {
        self.id = id
        self.name = name
        self.isOnboarded = isOnboarded
        self.settings = settings
        self.favoriteAffirmations = favoriteAffirmations
    }
}

