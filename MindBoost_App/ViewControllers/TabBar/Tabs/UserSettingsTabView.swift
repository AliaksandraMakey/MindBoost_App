//
//  TestVC.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import SwiftUI

struct UserSettingsTabView: View {
    // MARK: - Properties
    @ObservedObject var coordinator: TabBarCoordinator
    // MARK: - Localized properties
    var localizedGenderName: String {
        let gender = coordinator.viewModel.user.settings.gender
        return gender?.jsonNames[coordinator.currentLanguage] ?? gender?.gender ?? NSLocalizedString("userNotSpecified", comment: "")
    }
    // MARK: - Body
    var body: some View {
        let user = coordinator.viewModel.user
        
        ScrollView {
            VStack(spacing: 20) {
                UserSettingsItemView(title: "userName", value: user.name)
                UserSettingsItemView(title: "userGender", value: localizedGenderName)
                UserSettingsItemView(title: "userLanguage", value: user.settings.language?.language ?? NSLocalizedString("userNotSpecified", comment: ""))
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(localizedKey: "userBackground")
                        .font(.headline)
                        .foregroundColor(Color.Accents.num5)
                    if let background = user.settings.background {
                        background.backgroundType.image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .cornerRadius(10)
                    } else {
                        Color.gray
                            .frame(height: 100)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.Accents.num3)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(localizedKey: "userFavoriteCategories")
                        .font(.headline)
                        .foregroundColor(Color.Accents.num5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(user.settings.favoriteCategoryList ?? [], id: \.id) { category in
                                CategoryItemView(category: category, language: coordinator.currentLanguage, ifCatalog: false)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.Accents.num3)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 20)
        }
        .background(
            Image(user.settings.background?.backgroundType.imageName ?? "")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        .navigationTitle(TabBarPage.userSettings.localizedName)
    }
}
// MARK: - UserSettings Item View
struct UserSettingsItemView: View {
    // MARK: - Properties
    var title: String
    var value: String
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(localizedKey: title)
                .font(.headline)
                .foregroundColor(Color.Accents.num5)
            Text(value)
                .font(.subheadline)
                .foregroundColor(Color.Accents.num5)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.Accents.num3)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
        .padding(.horizontal, 20)
    }
}
