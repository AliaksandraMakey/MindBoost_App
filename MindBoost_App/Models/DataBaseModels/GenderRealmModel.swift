//
//  UserGenderDBModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 03.08.24.
//

import Foundation
import RealmSwift

class GenderRealmModel: Object {
    @Persisted var id: String = ""
    @Persisted var gender: String = ""
    @Persisted var identityCode: String = ""
    @Persisted var jsonNames = List<KeyValueRealmModel>()
}
