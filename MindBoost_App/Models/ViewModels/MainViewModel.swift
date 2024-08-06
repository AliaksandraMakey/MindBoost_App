//
//  MainViewModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import Foundation

class MailViewModel: ObservableObject {
    //MARK: - Properties
    @Published var user: User
    @Published var allCategories: [CategoryAppModel]?
    @Published var allAffirmations: [AffirmationAppModel]?

    private var categoriesProviderStrategy: CategoriesProviderStrategyProtocol
    private var affirmationStrategy: AffirmationsProviderStrategyProtocol
    //MARK: - Init
    /// Initializes a new instance of `MailViewModel`.
      /// - Parameters:
      ///   - user: The user for whom categories and affirmations will be loaded.
      ///   - categoriesProviderStrategy: A strategy for retrieving all available categories.
      ///   - affirmationStrategy: A strategy for retrieving affirmations based on category.
    init(user: User, categoriesProviderStrategy: CategoriesProviderStrategyProtocol, affirmationStrategy: AffirmationsProviderStrategyProtocol) {
        self.user = user
        self.categoriesProviderStrategy = categoriesProviderStrategy
        self.affirmationStrategy = affirmationStrategy
        self.allCategories = categoriesProviderStrategy.getAllCategories()
        guard let categories = user.settings.favoriteCategoryList?.first! else { return }
        self.allAffirmations = affirmationStrategy.getAllAffirmation(byCategory: categories)
    }
}

