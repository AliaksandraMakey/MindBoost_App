//
//  Affirmation.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 03.08.24.
//

import Foundation

struct AffirmationAppModel: Identifiable {
    var id: String
    var text: String
    var category: CategoryAppModel?
    var isFavorite: Bool

    init(id: String, text: String, category: CategoryAppModel?, isFavorite: Bool = false) {
        self.id = id
        self.text = text
        self.category = category
        self.isFavorite = isFavorite
    }
}
