//
//  UserRealmStrategy.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 04.08.24.
//

import Foundation
import RealmSwift

/// `UserRealmStrategy` provides a concrete implementation of `UserStrategyProtocol` using Realm for data storage.
/// It manages user data persistence, retrieval, and updates by interacting with a `DatabaseService`.
class UserRealmStrategy: UserStrategyProtocol {
    
    // MARK: - Properties
    /// An instance of `DatabaseService` for interacting with the Realm database.
    private let databaseService = DatabaseService()
    
    // MARK: - UserStrategyProtocol
    /// Retrieves a `User` object from the database, converting it from a `UserRealmModel`.
    /// - Returns: A `User` object populated with data from Realm.
    func getUser() -> User {
        let userRealmModel = databaseService.getUser()
        return mapUserRealmModelToUser(userRealmModel)
    }
    /// Saves a `User` object to the database, converting it to a `UserRealmModel` before persistence.
    /// - Parameter user: The `User` to save in the database.
    func saveUser(_ user: User) {
        let userRealmModel = mapUserToUserRealmModel(user)
        databaseService.saveUser(userRealmModel)
    }
    /// Updates a `User` object in the database by modifying category preferences or other settings.
    /// - Parameter user: The `User` to update.
    func updateUser(_ user: User) {
        var updatedUser = user
        let currentCategories = getUser().settings.favoriteCategoryList ?? []
        
        // Updates or adds categories in the user's preferences
        var updatedCategories = currentCategories
        
        if let newCategories = user.settings.favoriteCategoryList {
            for newCategory in newCategories {
                if let existingCategoryIndex = updatedCategories.firstIndex(where: { $0.identityCode == newCategory.identityCode }) {
                    updatedCategories[existingCategoryIndex] = newCategory
                } else {
                    updatedCategories.append(newCategory)
                }
            }
        }
        
        updatedUser.settings.favoriteCategoryList = updatedCategories
        
        let userRealmModel = mapUserToUserRealmModel(updatedUser)
        databaseService.saveUser(userRealmModel)
    }
    // MARK: - Private Helper Methods
    /// Converts `UserRealmModel` to `User`, mapping embedded realm models to app models.
    private func mapUserRealmModelToUser(_ userRealmModel: UserRealmModel) -> User {
        let favoriteCategories: [CategoryAppModel] = userRealmModel.settings?.favoriteCategoryList.map {
            mapCategoryRealmModelToCategoryAppModel($0)
        } ?? []
        
        let affirmations: [AffirmationAppModel] = userRealmModel.favoriteAffirmations.map { affirmationRealmModel in
            let categoryAppModel = mapCategoryRealmModelToCategoryAppModel(affirmationRealmModel.category)
            return AffirmationAppModel(id: affirmationRealmModel.id, text: affirmationRealmModel.text, category: categoryAppModel, isFavorite: affirmationRealmModel.isFavorite)
        }
        
        let background: BackgroundAppModel? = {
            if let bgRealm = userRealmModel.settings?.background {
                return BackgroundAppModel(id: bgRealm.id, identityCode: userRealmModel.id, backgroundType: BackgroundType(rawValue: bgRealm.type) ?? .blueBackground)
            }
            return nil
        }()
        
        let language: LanguageModel? = {
            if let langRealm = userRealmModel.settings?.language {
                return LanguageModel(id: langRealm.id, language: langRealm.type, identityCode: langRealm.identityCode)
            }
            return nil
        }()
        
        let userSettings = UserSettingsAppModel(
            favoriteCategoryList: favoriteCategories,
            language: language,
            gender: userRealmModel.settings?.gender == nil ? nil : GenderAppModel(id: userRealmModel.settings!.gender!.id, gender: userRealmModel.settings!.gender!.gender, identityCode: userRealmModel.settings!.gender?.identityCode ?? "", jsonNames: mapKeyValueListToDictionary(userRealmModel.settings?.gender?.jsonNames)),
            background: background
        )
        
        return User(id: userRealmModel.id, name: userRealmModel.name, isOnboarded: userRealmModel.isOnboarded, settings: userSettings, favoriteAffirmations: affirmations)
    }
    /// Converts `User` to `UserRealmModel`, mapping app models to embedded realm models.
    private func mapUserToUserRealmModel(_ user: User) -> UserRealmModel {
        let userRealmModel = UserRealmModel()
        userRealmModel.id = user.id
        userRealmModel.name = user.name
        userRealmModel.isOnboarded = user.isOnboarded
        
        let settingsRealmModel = UserSettingsRealmModel()
        
        if let gender = user.settings.gender {
            let genderRealmModel = mapGenderAppModelToGenderRealmModel(gender)
            settingsRealmModel.gender = genderRealmModel
        }
        
        if let background = user.settings.background {
            let backgroundRealmModel = BackgroundRealmModel()
            backgroundRealmModel.id = background.id
            backgroundRealmModel.type = background.backgroundType.rawValue
            settingsRealmModel.background = backgroundRealmModel
        }
        
        if let language = user.settings.language {
            let languageRealmModel = LanguageRealmModel()
            languageRealmModel.id = language.id
            languageRealmModel.type = language.language
            languageRealmModel.identityCode = language.identityCode
            settingsRealmModel.language = languageRealmModel
        }
        
        settingsRealmModel.favoriteCategoryList.append(objectsIn: user.settings.favoriteCategoryList?.map {
            mapCategoryAppModelToCategoryRealmModel($0)
        } ?? [])
        
        userRealmModel.settings = settingsRealmModel
        userRealmModel.favoriteAffirmations.append(objectsIn: user.favoriteAffirmations.map {
            let affirmationRealmModel = AffirmationRealmModel()
            affirmationRealmModel.id = $0.id
            affirmationRealmModel.text = $0.text
            affirmationRealmModel.category = mapCategoryAppModelToCategoryRealmModel($0.category ??  CategoryAppModel(id: "", name: "", identityCode: "", jsonNames: [:]))
            affirmationRealmModel.isFavorite = $0.isFavorite
            return affirmationRealmModel
        })
        
        return userRealmModel
    }
    /// Converts `CategoryAppModel` to `CategoryRealmModel`, mapping app models to embedded realm models.
    private func mapCategoryAppModelToCategoryRealmModel(_ category: CategoryAppModel) -> CategoryRealmModel {
        let categoryRealmModel = CategoryRealmModel()
        categoryRealmModel.id = category.id
        categoryRealmModel.name = category.name
        categoryRealmModel.identityCode = category.identityCode
        for (key, value) in category.jsonNames {
            let keyValue = KeyValueRealmModel()
            keyValue.key = key
            keyValue.value = value
            categoryRealmModel.jsonNames.append(keyValue)
        }
        return categoryRealmModel
    }
    /// Converts `CategoryRealmModel` to `CategoryAppModel`, mapping app models to embedded realm models.
    private func mapCategoryRealmModelToCategoryAppModel(_ categoryRealmModel: CategoryRealmModel?) -> CategoryAppModel {
        guard let categoryRealmModel = categoryRealmModel else {
            return CategoryAppModel(id: "", name: "", identityCode: "", jsonNames: [:])
        }
        var jsonNames: [String: String] = [:]
        for keyValue in categoryRealmModel.jsonNames {
            jsonNames[keyValue.key] = keyValue.value
        }
        return CategoryAppModel(id: categoryRealmModel.id, name: categoryRealmModel.name, identityCode: categoryRealmModel.identityCode, jsonNames: jsonNames)
    }
    /// Converts `GenderAppModel` to `GenderRealmModel`, mapping app models to embedded realm models.
    private func mapGenderAppModelToGenderRealmModel(_ gender: GenderAppModel) -> GenderRealmModel {
        let genderRealmModel = GenderRealmModel()
        genderRealmModel.id = gender.id
        genderRealmModel.gender = gender.gender
        genderRealmModel.identityCode = gender.identityCode
        for (key, value) in gender.jsonNames {
            let keyValue = KeyValueRealmModel()
            keyValue.key = key
            keyValue.value = value
            genderRealmModel.jsonNames.append(keyValue)
        }
        return genderRealmModel
    }
    /// Converts `GenderRealmModel` to `GenderAppModel`, mapping app models to embedded realm models.
    private func mapGenderRealmModelToGenderAppModel(_ genderRealmModel: GenderRealmModel?) -> GenderAppModel {
        guard let genderRealmModel = genderRealmModel else {
            return GenderAppModel(id: "", gender: "", identityCode: "", jsonNames: [:])
        }
        var jsonNames: [String: String] = [:]
        for keyValue in genderRealmModel.jsonNames {
            jsonNames[keyValue.key] = keyValue.value
        }
        return GenderAppModel(id: genderRealmModel.id, gender: genderRealmModel.gender, identityCode: genderRealmModel.identityCode, jsonNames: jsonNames)
    }
    /// Converts `KeyValue` to `DictionaryKeyValueList`, mapping app models to embedded realm models.
    private func mapKeyValueListToDictionary(_ keyValueList: List<KeyValueRealmModel>?) -> [String: String] {
        var dictionary: [String: String] = [:]
        guard let keyValueList = keyValueList else { return dictionary }
        for keyValue in keyValueList {
            dictionary[keyValue.key] = keyValue.value
        }
        return dictionary
    }
}
