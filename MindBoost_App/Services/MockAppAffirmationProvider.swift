//
//  MockAppAffirmationProvider.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import Foundation

class MockAppAffirmationProvider: AffirmationsProviderStrategyProtocol {
    func getAllAffirmation(byCategory category: CategoryAppModel) -> [AffirmationAppModel] {
        let categoriesProvider = MockAppCategoriesProvider()
        let categories = categoriesProvider.getAllCategories()
        
        guard let selectedCategory = categories.first(where: { $0.identityCode == category.identityCode }) else {
            return []
        }
        
        let allAffirmations = [
            // Love Affirmations
            AffirmationAppModel(id: UUID().uuidString, text: "love_affirmation_1", category: categories.first(where: { $0.identityCode == "1" })),
            AffirmationAppModel(id: UUID().uuidString, text: "love_affirmation_2", category: categories.first(where: { $0.identityCode == "1" })),
            AffirmationAppModel(id: UUID().uuidString, text: "love_affirmation_3", category: categories.first(where: { $0.identityCode == "1" })),
            AffirmationAppModel(id: UUID().uuidString, text: "love_affirmation_4", category: categories.first(where: { $0.identityCode == "1" })),
            AffirmationAppModel(id: UUID().uuidString, text:  "love_affirmation_5" , category: categories.first(where: { $0.identityCode == "1" })),
            AffirmationAppModel(id: UUID().uuidString, text:  "love_affirmation_6" , category: categories.first(where: { $0.identityCode == "1" })),
            AffirmationAppModel(id: UUID().uuidString, text:  "love_affirmation_7" , category: categories.first(where: { $0.identityCode == "1" })),
            AffirmationAppModel(id: UUID().uuidString, text:  "love_affirmation_8" , category: categories.first(where: { $0.identityCode == "1" })),
            AffirmationAppModel(id: UUID().uuidString, text:  "love_affirmation_9" , category: categories.first(where: { $0.identityCode == "1" })),
            AffirmationAppModel(id: UUID().uuidString, text:  "love_affirmation_10" , category: categories.first(where: { $0.identityCode == "1" })),

            // Friendship Affirmations
            AffirmationAppModel(id: UUID().uuidString, text: "friend_affirmation_1", category: categories.first(where: { $0.identityCode == "2" })),
            AffirmationAppModel(id: UUID().uuidString, text: "friend_affirmation_2", category: categories.first(where: { $0.identityCode == "2" })),
            AffirmationAppModel(id: UUID().uuidString, text: "friend_affirmation_3", category: categories.first(where: { $0.identityCode == "2" })),
            AffirmationAppModel(id: UUID().uuidString, text: "friend_affirmation_4", category: categories.first(where: { $0.identityCode == "2" })),
            AffirmationAppModel(id: UUID().uuidString, text: "friend_affirmation_5", category: categories.first(where: { $0.identityCode == "2" })),
            AffirmationAppModel(id: UUID().uuidString, text: "friend_affirmation_6", category: categories.first(where: { $0.identityCode == "2" })),
            AffirmationAppModel(id: UUID().uuidString, text:  "friend_affirmation_7" , category: categories.first(where: { $0.identityCode == "2" })),
            AffirmationAppModel(id: UUID().uuidString, text:  "friend_affirmation_8" , category: categories.first(where: { $0.identityCode == "2" })),
            AffirmationAppModel(id: UUID().uuidString, text:  "friend_affirmation_9" , category: categories.first(where: { $0.identityCode == "2" })),
            AffirmationAppModel(id: UUID().uuidString, text:  "friend_affirmation_10" , category: categories.first(where: { $0.identityCode == "2" }))
        ]
        
        return allAffirmations.filter { $0.category?.identityCode == selectedCategory.identityCode }
    }
}
