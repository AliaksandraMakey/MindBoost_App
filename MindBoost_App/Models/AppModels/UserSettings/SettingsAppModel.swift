//
//  SettingsAppModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import Foundation

class SettingsAppModel {
    var genders: [GenderAppModel]
    var languages: [LanguageModel]
    var backgrounds:  [BackgroundAppModel]
    var categories:  [CategoryAppModel]
    
    init(genders: [GenderAppModel], languages: [LanguageModel], backgrounds: [BackgroundAppModel], categories: [CategoryAppModel]) {
        self.genders = genders
        self.languages = languages
        self.backgrounds = backgrounds
        self.categories = categories
    }
}
