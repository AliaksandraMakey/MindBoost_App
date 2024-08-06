//
//  UserSettingsDBModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 03.08.24.
//

import RealmSwift
import Foundation

class UserSettingsRealmModel: Object {
    @Persisted var gender: GenderRealmModel?
    @Persisted var favoriteCategoryList: List<CategoryRealmModel> = List<CategoryRealmModel>()
    @Persisted var background: BackgroundRealmModel?
    @Persisted var language: LanguageRealmModel?
}

