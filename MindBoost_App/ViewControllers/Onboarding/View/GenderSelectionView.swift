//
//  GenderSelectionView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import SwiftUI

struct GenderSelectionView: View {
    //MARK: - Properties
    @ObservedObject var coordinator: OnboardingCoordinator
    @State private var selectedGender: GenderAppModel?
    // MARK: - Body
    var body: some View {
        VStack {
            Text(localizedKey: "select_gender")
                .foregroundColor(Color.Accents.num5)
                .padding(.leading)

            ForEach(coordinator.viewModel.settings.genders, id: \.id) { gender in
                SelectableItemView(title: gender.gender, isSelected: selectedGender?.id == gender.id)
                    .onTapGesture {
                        selectedGender = gender
                    }
                    .padding(.horizontal, Device.iPhone ? 20 : 40)
            }

            CustomContinueButton(action: {
                if let selectedGender = selectedGender {
                    coordinator.viewModel.saveGender(selectedGender)
                    coordinator.nextPage()
                }
            }, titleKey: "continue")
        }
        .customFrameAndBackground()
    }
}
