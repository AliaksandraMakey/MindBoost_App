//
//  MindBoost_AppApp.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 02.08.24.
//


import SwiftUI


@main
struct MindBoost_AppApp: App {
    
    // MARK: - Properties
    /// State object for managing localization across the app.
    @StateObject private var localizationService = LocalizationService.shared
    /// State object for managing onboarding process and user settings.
    @StateObject private var onboardingViewModel = OnboardingViewModel(userStrategy: UserRealmStrategy(), settingsStrategy: MockUserSettingsProvider())

    // MARK: - App Body
    var body: some Scene {
        WindowGroup {
            // Conditional view presentation based on onboarding completion.
            if onboardingViewModel.isOnboardingCompleted() {
                // Main interface shown when onboarding is complete.
                MainTabBarView(viewModel: MailViewModel(user: onboardingViewModel.user,
                                                        categoriesProviderStrategy: MockAppCategoriesProvider(),
                                                        affirmationStrategy: MockAppAffirmationProvider()))
                            .environmentObject(onboardingViewModel)
                            .environmentObject(localizationService)
            } else {
                // Onboarding interface shown when onboarding is not complete.
                OnboardingView(viewModel: onboardingViewModel)
                    .environmentObject(onboardingViewModel)
                    .environmentObject(localizationService)
            }
        }
    }
}
