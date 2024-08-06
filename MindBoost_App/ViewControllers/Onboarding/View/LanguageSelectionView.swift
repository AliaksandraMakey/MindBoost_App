//
//  LanguageSelectionView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import SwiftUI

struct LanguageSelectionView: View {
    // MARK: - Properties
    @ObservedObject var coordinator: OnboardingCoordinator
    @State private var selectedLanguage: LanguageModel?
    @EnvironmentObject var localizationService: LocalizationService
    // MARK: - Body
    var body: some View {
        VStack {
            Text(localizedKey: "select_language")
                .foregroundColor(Color.Accents.num5)
                .padding(.leading)

            ForEach(coordinator.viewModel.settings.languages, id: \.id) { language in
                SelectableItemView(title: language.language, isSelected: selectedLanguage?.id == language.id)
                    .onTapGesture {
                        selectedLanguage = language
                        localizationService.currentLanguage = language.language
                    }
                    .padding(.horizontal, Device.iPhone ? 20 : 40)
            }

            CustomContinueButton(action: {
                if let language = selectedLanguage {
                    coordinator.viewModel.saveLanguage(language)
                    coordinator.nextPage()
                }
            }, titleKey: "continue")
        }
        .customFrameAndBackground()
        // MARK: - Lifecycle
        .onAppear {
            selectedLanguage = coordinator.viewModel.settings.languages.first { $0.language == localizationService.currentLanguage }
        }
        .onChange(of: localizationService.currentLanguage) { newLanguage in
            selectedLanguage = coordinator.viewModel.settings.languages.first { $0.language == newLanguage }
        }
    }
}    // MARK: - Body
