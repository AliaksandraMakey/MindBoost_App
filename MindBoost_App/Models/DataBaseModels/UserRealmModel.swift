//
//  UserDBModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 03.08.24.
//

import RealmSwift
import Foundation

class UserRealmModel: Object {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var name: String = ""
    @Persisted var isOnboarded: Bool = false
    @Persisted var settings: UserSettingsRealmModel?
    @Persisted var favoriteAffirmations = List<AffirmationRealmModel>()
}
