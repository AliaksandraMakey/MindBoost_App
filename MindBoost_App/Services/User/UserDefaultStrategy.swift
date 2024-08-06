//
//  UserDefaultStrategy.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 04.08.24.
//

import Foundation

class UserDefaultStrategy: UserStrategyProtocol {
    var user = User(id: "12345", name: "", isOnboarded: false, settings: UserSettingsAppModel(language: LanguageModel(id: "1", language: "en", identityCode: "1"), gender: GenderAppModel(id: "", gender: "1", identityCode: "1", jsonNames: ["en" : "Male"]), background: BackgroundAppModel(id: "12345", identityCode: "1", backgroundType: BackgroundType.none)))
    
    func updateUser(_ user: User) {
        self.user = user
    }
    func getUser() -> User {
        return self.user
    }
}

