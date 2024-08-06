//
//  CategoriesTabView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import SwiftUI

struct CategoriesTabView: View {
    // MARK: - Properties
    @ObservedObject var coordinator: TabBarCoordinator
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    // MARK: - Body
    var body: some View {
        let user = coordinator.viewModel.user
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(coordinator.viewModel.allCategories ?? [], id: \.id) { category in
                    CategoryItemView(category: category, language: coordinator.currentLanguage, ifCatalog: true)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                }
            }
            .padding(20)
        }
        .navigationTitle(TabBarPage.categorie.localizedName)
        .background(
            Image(user.settings.background?.backgroundType.imageName ?? "")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}
// MARK: - Category Item View
struct CategoryItemView: View {
    // MARK: - Properties
    var category: CategoryAppModel
    var language: String
    var size: CGFloat = Device.iPhone ? 10.0 : 20.0
    var ifCatalog: Bool
    // MARK: - Localized properties
    var localizedCategoryName: String {
        category.jsonNames[language] ?? category.name
    }
    // MARK: - Body
    var body: some View {
        VStack {
            Text(localizedCategoryName)
                .lineLimit(2)
                .padding(.top, size)
                .multilineTextAlignment(.leading)
            HStack {
                if (category.iconeName != nil) && ifCatalog {
                    Image(category.iconeName!)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .cornerRadius(10)
                } else {
                    Image(systemName: "")
                        .frame(width: 0, height: 0)
                }
            }
            .background(Color.Accents.num4)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
            .padding(.horizontal, 20)
            
        }
    }
}
