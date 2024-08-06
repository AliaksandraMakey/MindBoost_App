//
//  CategorySelectionView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import SwiftUI

struct CategorySelectionView: View {
    // MARK: - Properties
    @ObservedObject var coordinator: OnboardingCoordinator
    @State private var selectedCategory: CategoryAppModel?
    // MARK: - Body
    var body: some View {
        VStack {
            Text(localizedKey: "select_category")
                .foregroundColor(Color.Accents.num5)
                .padding(.leading)
            
            ForEach(coordinator.viewModel.settings.categories, id: \.id) { category in
                SelectableItemView(title: category.name, isSelected: selectedCategory?.id == category.id)
                    .onTapGesture {
                        selectedCategory = category
                    }
                    .padding(.horizontal, Device.iPhone ? 20 : 40)
            }
            
            CustomContinueButton(action: {
                if let selectedCategory = selectedCategory {
                    coordinator.viewModel.addFavoriteCategory(selectedCategory)
                    coordinator.nextPage()
                }
            }, titleKey: "continue")
        }
        .customFrameAndBackground()
    }
}
