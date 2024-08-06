//
//  MockAppCategoriesProvider.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import Foundation

class MockAppCategoriesProvider: CategoriesProviderStrategyProtocol {
    func getAllCategories() -> [CategoryAppModel] {
        return [
                CategoryAppModel(id: "1", name: "Love", identityCode: "1", iconeName: "love", jsonNames: ["ru" : "любовь", "en" : "love"]),
                CategoryAppModel(id: "2", name: "Friendship", identityCode: "2", iconeName: "friend", jsonNames:["ru" : "друзья", "en" : "friends"])
                    ]
    }
}

