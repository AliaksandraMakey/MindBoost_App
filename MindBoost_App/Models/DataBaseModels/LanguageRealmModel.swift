//
//  LanguageRealmModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import Foundation
import RealmSwift

class LanguageRealmModel: Object {
    @Persisted var id: String = ""
    @Persisted var type: String = ""
    @Persisted var identityCode: String = ""
}
