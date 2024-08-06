//
//  DatabaseService.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 04.08.24.
//

import RealmSwift
import SwiftUI

/// `DatabaseService` is responsible for managing the database operations using Realm.
class DatabaseService {
    /// A private instance of `Realm` used for database operations.
    private let realm: Realm
    
    /// Initializes a new `DatabaseService` instance.
    /// It configures the Realm database with a specific schema version and handles migrations.
    /// If a migration is needed and the schema version is less than 1, it performs necessary migration tasks.
    /// It also sets the configuration to delete the database if a migration is needed.
    init() {
        var config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    // Perform migrations when schema versions are less than 1
                }
            })
        config.deleteRealmIfMigrationNeeded = true
        
        self.realm = try! Realm(configuration: config)
        print("Realm database file path: \(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    /// Saves a `UserRealmModel` object to the Realm database.
    /// - Parameter userRealmModel: The `UserRealmModel` to be saved.
    func saveUser(_ userRealmModel: UserRealmModel) {
        try! realm.write {
            realm.add(userRealmModel, update: .modified)
        }
    }
    
    /// Retrieves the first `UserRealmModel` object from the Realm database.
    /// If no objects are found, it creates a new `UserRealmModel`, adds it to the database, and returns it.
    /// - Returns: A `UserRealmModel` instance.
    func getUser() -> UserRealmModel {
        guard let userRealmModel = realm.objects(UserRealmModel.self).first else {
            let userRealm = UserRealmModel()
            try! realm.write {
                realm.add(userRealm)
            }
            return userRealm
        }
        return userRealmModel
    }
}
