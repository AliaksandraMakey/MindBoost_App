//
//  UserSettings.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 03.08.24.
//

import Foundation

class UserSettingsAppModel {
    var favoriteCategoryList: [CategoryAppModel]?
    var gender: GenderAppModel?
    var language: LanguageModel?
    var background:  BackgroundAppModel?
    
    init(favoriteCategoryList: [CategoryAppModel]? = nil, language: LanguageModel?, gender: GenderAppModel? = nil, background: BackgroundAppModel? = nil) {
        self.favoriteCategoryList = favoriteCategoryList
        self.favoriteCategoryList = favoriteCategoryList
        self.language = language
        self.gender = gender
        self.background = background
    }
}
