//
//  TabBarCoordinator.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import Foundation

// MARK: - TabBarCoordinator Class
class TabBarCoordinator: ObservableObject, AppCoordinatorProtocol {
    // MARK: - Properties
    @Published var currentPage: TabBarPage = .categorie
    @Published var viewModel: MailViewModel
    /// Current language extracted from user settings.
    var currentLanguage: String {
        viewModel.user.settings.language?.language ?? "en"
    }
    // MARK: - Init
    init(viewModel: MailViewModel) {
        self.viewModel = viewModel
    }
    // MARK: - Coordinator Start
    /// Initializes or resets the currentPage to categories.
    func start() {
        currentPage = .categorie
    }
    // MARK: - Tab Bar Views Creation
    /// Creates the main tab bar view.
    func createTabBar() -> MainTabBarView {
        return MainTabBarView(viewModel: viewModel)
    }
    /// Shows categories tab.
    func showCategories() -> CategoriesTabView {
        return CategoriesTabView(coordinator: self)
    }
    /// Shows all affirmations tab.
    func showAllAffirmations() -> AllAffirmationsTabView {
        return AllAffirmationsTabView(coordinator: self)
    }
    /// Shows favorite affirmations tab.
    func showFavoriteAffirmations() -> FavoriteTabAffirmationsView {
        return FavoriteTabAffirmationsView(coordinator: self, affirmations: viewModel.user.favoriteAffirmations)
    }
    /// Shows user settings tab.
    func showUserSettings() -> UserSettingsTabView {
        return UserSettingsTabView(coordinator: self)
    }
    // MARK: - Page Selection
    /// Sets the current page based on the selected tab.
    func selectPage(_ page: TabBarPage) {
        currentPage = page
    }
}
