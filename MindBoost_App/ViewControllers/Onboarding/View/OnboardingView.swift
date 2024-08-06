//
//  OnboardingView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 03.08.24.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Properties
    @StateObject private var coordinator: OnboardingCoordinator
    // MARK: - Init
    init(viewModel: OnboardingViewModel) {
        _coordinator = StateObject(wrappedValue: OnboardingCoordinator(viewModel: viewModel))
    }
    // MARK: - Body
    var body: some View {
        VStack {
            // MARK: - Page Content
            switch coordinator.currentPage {
            case .name:
                NameView(coordinator: coordinator)
            case .category:
                CategorySelectionView(coordinator: coordinator)
            case .gender:
                GenderSelectionView(coordinator: coordinator)   
            case .language:
                LanguageSelectionView(coordinator: coordinator)
            case .background:
                BackgroundSelectionView(coordinator: coordinator)
            }
        }
        .navigationBarHidden(true)
        .background(Color.Accents.num3)
        .edgesIgnoringSafeArea(.all)
    }
}
