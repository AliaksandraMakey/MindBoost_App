//
//  OnboardingViewModel.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 03.08.24.
//

import SwiftUI
import Foundation

class OnboardingViewModel: ObservableObject {
    //MARK: - Properties
    @Published var user: User
    @Published var settings: SettingsAppModel

    private var userStrategy: UserStrategyProtocol
    private var settingsStrategy: SettingsProviderStrategyProtocol
    var completedPages: Set<OnboardingPage> = []
    //MARK: - Init
    /// - Parameters:
    ///   - userStrategy: A strategy for loading and saving user data.
    ///   - settingsStrategy: A strategy for loading and saving settings data.
    init(userStrategy: UserStrategyProtocol, settingsStrategy: SettingsProviderStrategyProtocol) {
        self.userStrategy = userStrategy
        self.settingsStrategy = settingsStrategy
        self.user = userStrategy.getUser()
        self.settings = settingsStrategy.getSettings()
    }
    //MARK: - Metods
    /// Marks an onboarding page as completed and updates the user data.
    /// - Parameter page: The onboarding page to mark as completed.
    func completePage(_ page: OnboardingPage) {
        completedPages.insert(page)
        updateUser()
    }
    /// Determines if the onboarding process is completed.
    /// - Returns: A Boolean indicating whether onboarding is complete.
    func isOnboardingCompleted()  -> Bool {
        return user.isOnboarded || completedPages.count == OnboardingPage.allCases.count
    }
    /// Saves the user's name and updates the onboarding status.
    /// - Parameter name: The user's name to save.
    func saveUserName(_ name: String) {
        user.name = name
        self.user = user
        completePage(.name)
    }
    /// Adds a favorite category to the user's profile and updates the onboarding status.
    /// - Parameter category: The category to add.
    func addFavoriteCategory(_ category: CategoryAppModel) {
        user.settings.favoriteCategoryList?.append(category)
        completePage(.category)
    }
    /// Saves the user's gender and updates the onboarding status.
    /// - Parameter gender: The user's gender to save.
    func saveGender(_ gender: GenderAppModel) {
        user.settings.gender = gender
        completePage(.gender)
    }
    
    /// Saves the user's language preference and updates the onboarding status.
    /// - Parameter language: The language to set.
    func saveLanguage(_ language: LanguageModel) {
        user.settings.language = language
        completePage(.language)
    }
    
    /// Saves the user's background preference and updates the onboarding status.
    /// - Parameter background: The background to set.
    func saveBackground(_ background: BackgroundAppModel) {
        user.settings.background = background
        completePage(.background)
    }
    
    /// Updates the user data in the database if onboarding is complete.
    private func updateUser() {
        if isOnboardingCompleted() {
            self.user.isOnboarded = true
        }
        userStrategy.updateUser(user)
    }
}
