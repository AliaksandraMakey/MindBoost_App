//
//  BackgroundSelectionView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import SwiftUI

struct BackgroundSelectionView: View {
    // MARK: - Properties
    @ObservedObject var coordinator: OnboardingCoordinator
    @State private var selectedBackground: BackgroundAppModel?
    // MARK: - Body
    var body: some View {
        VStack {
            Text(localizedKey: "select_background")
                .foregroundColor(Color.Accents.num5)
                .padding(.leading)

            ForEach(coordinator.viewModel.settings.backgrounds, id: \.id) { background in
                BackgroundView(background: background, isSelected: selectedBackground?.id == background.id)
                    .onTapGesture {
                        selectedBackground = background
                    }
            }
            CustomContinueButton(action: {
                if let selectedBackground = selectedBackground {
                    coordinator.viewModel.saveBackground(selectedBackground)
                    coordinator.isLastPage
                    coordinator.nextPage()
                }
            }, titleKey: "continue")
            .padding(.top, 20)
            .padding(.horizontal, Device.iPhone ? 20 : 40)
        }
        .frame(width: Device.iPhone ? 300 : 400 , height: 400, alignment: .center)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        .background(
            (selectedBackground as? BackgroundAppModel)?.backgroundType.image
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}

