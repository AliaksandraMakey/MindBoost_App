//
//  SettingsView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 02.08.24.
//

import SwiftUI

struct MainTabBarView: View {
    // MARK: - Properties
    @StateObject var coordinator: TabBarCoordinator
    // MARK: - Init
    init(viewModel: MailViewModel) {
        _coordinator = StateObject(wrappedValue: TabBarCoordinator(viewModel: viewModel))
    }
    // MARK: - Body
    var body: some View {
        let user = coordinator.viewModel.user
        TabView(selection: $coordinator.currentPage) {
            // MARK: - Tab Items
            ForEach(TabBarPage.allCases, id: \.self) { page in
                view(for: page)
                    .tabItem {
                        Label {
                            Text(localizedKey: page.rawValue)
                                .foregroundColor(page == coordinator.currentPage ? .accentColor : .white)
                        } icon: {
                            Image(systemName: page.systemImage)
                                .foregroundColor(page == coordinator.currentPage ? .accentColor : .white)
                        }
                    }
                    .tag(page)
            }
        }
        .accentColor(Color.Accents.num1)
        .background(
            Image(user.settings.background?.backgroundType.imageName ?? "")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            // MARK: - Tab Bar Appearance
            UITabBar.appearance().unselectedItemTintColor = UIColor.white
            UITabBar.appearance().backgroundColor = UIColor.clear
        }
    }
    // MARK: - Helper Methods
    @ViewBuilder
    private func view(for page: TabBarPage) -> some View {
        switch page {
        case .categorie:
            coordinator.showCategories()
        case .allAffirmations:
            coordinator.showAllAffirmations()
        case .favoriteAffirmations:
            coordinator.showFavoriteAffirmations()
        case .userSettings:
            coordinator.showUserSettings()
        }
    }
}
