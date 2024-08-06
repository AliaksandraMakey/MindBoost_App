//
//  AffirmationRealmModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import Foundation
import RealmSwift

class AffirmationRealmModel: Object {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var text: String = ""
    @Persisted var category: CategoryRealmModel?
    @Persisted var isFavorite: Bool = false
}
