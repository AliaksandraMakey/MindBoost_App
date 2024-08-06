//
//  NameView.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 05.08.24.
//

import SwiftUI


struct NameView: View {
    // MARK: - Properties
    @ObservedObject var coordinator: OnboardingCoordinator
    @State private var newUserName: String = ""
    // MARK: - Body
    var body: some View {
        VStack {
            VStack {
                Text(localizedKey: "set_name")
                    .foregroundColor(Color.Accents.num5)
                    .padding(.bottom, 10)

                TextField("", text: $newUserName)
                    .padding()
                    .foregroundColor(Color.Accents.num5)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.Accents.num2, lineWidth: 2)
                    )
                    .padding(.bottom, 20)
                CustomContinueButton(action: {
                    if !newUserName.isEmpty {
                        coordinator.viewModel.saveUserName(newUserName)
                        coordinator.nextPage()
                    }
                }, titleKey: "continue")
                .padding(.top, 20)
            }
            .padding(Device.iPhone ? 20 : 40)
            .navigationBarItems(trailing: Button("Next") {
                coordinator.nextPage()
            }
            .foregroundColor(Color.Accents.num5))
        }
        .customFrameAndBackground()
    }
}
