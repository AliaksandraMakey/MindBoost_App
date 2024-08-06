//
//  BackgroundRealmModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 04.08.24.
//

import Foundation
import RealmSwift

class BackgroundRealmModel: Object {
    @Persisted var id: String = ""
    @Persisted var type: String = ""
    @Persisted var identityCode: String = ""
}
