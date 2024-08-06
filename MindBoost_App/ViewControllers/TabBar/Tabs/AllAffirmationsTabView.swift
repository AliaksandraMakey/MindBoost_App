//
//  AllAffirmationsTabView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import SwiftUI


struct AllAffirmationsTabView: View {
    // MARK: - Properties
    @ObservedObject var coordinator: TabBarCoordinator
    // MARK: - Body
    var body: some View {
        let user = coordinator.viewModel.user
        TabView {
            ForEach(coordinator.viewModel.allAffirmations ?? [], id: \.id) { affirmation in
                VStack {
                    Spacer()
                    VStack {
                        Text(localizedKey: affirmation.text)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.black.opacity(0.7))
                            )
                            .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        Image("\(user.settings.background?.backgroundType.imageName ?? "")")
                            .resizable()
                            .scaledToFill()
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .cornerRadius(20)
                            .padding()
                    )
                    .padding(20)
                    Spacer()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .background(
               Image(user.settings.background?.backgroundType.imageName ?? "")
                   .resizable()
                   .scaledToFill()
                   .edgesIgnoringSafeArea(.all)
           )
        .navigationTitle(TabBarPage.allAffirmations.localizedName)
    }
}
