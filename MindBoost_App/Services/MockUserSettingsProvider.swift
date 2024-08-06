//
//  MockUserSettingsProvider.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import Foundation

class MockUserSettingsProvider: SettingsProviderStrategyProtocol {
    var settings = SettingsAppModel(genders: [
        GenderAppModel(id: "1", gender: "Male", identityCode: "1", jsonNames: ["ru" : "Мужчина", "en" : "Male"]),
        GenderAppModel(id: "2", gender: "Female", identityCode: "2", jsonNames: ["ru" : "Женщина", "en" : "Female"]),
        GenderAppModel(id: "3", gender: "Non-binary", identityCode: "3", jsonNames: ["ru" : "Не однозначно", "en" : "Non-binary"]),
        GenderAppModel(id: "4", gender: "Other", identityCode: "4", jsonNames: ["ru" : "Другое", "en" : "Other"])
    ], languages: [
        LanguageModel(id: "1", language: "en", identityCode: "1"),
        LanguageModel(id: "2", language: "ru", identityCode: "2")
    ], backgrounds: [
        BackgroundAppModel(id: "1", identityCode: "1", backgroundType: .blueBackground),
        BackgroundAppModel(id: "2", identityCode: "2", backgroundType: .redBackground)
    ], categories: [
        CategoryAppModel(id: "1", name: "Love", identityCode: "1", iconeName: "love", jsonNames: ["ru" : "Любовь", "en" : "Love"]),
        CategoryAppModel(id: "2", name: "Friendship", identityCode: "2", iconeName: "friend", jsonNames:["ru" : "Друзья", "en" : "Friends"])
            ])
    
    func getSettings() -> SettingsAppModel {
        return self.settings
    }
    
    func saveUserSettings(_ settings: SettingsAppModel) {
        self.settings = settings
    }
    
}
