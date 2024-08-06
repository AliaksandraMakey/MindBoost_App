//
//  UserGenderAppModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 04.08.24.
//

import Foundation

struct GenderAppModel: Identifiable, Codable {
    var id: String
    var gender: String
    var identityCode: String
    var jsonNames: [String: String]
}
