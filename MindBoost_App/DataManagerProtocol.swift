import Foundation
import Combine
import RealmSwift

protocol DataManagerProtocol {
    func fetchCategories() -> [String]
    func fetchLanguages() -> [String]
}
