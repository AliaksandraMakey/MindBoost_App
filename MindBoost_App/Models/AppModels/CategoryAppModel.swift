//
//  Category.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 04.08.24.
//

import Foundation

struct CategoryAppModel: Identifiable, Codable {
    
    let id: String
    var name: String
    var identityCode: String
    var iconeName: String?
    var jsonNames: [String: String]
}
