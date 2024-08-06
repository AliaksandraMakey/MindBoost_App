//
//  OnboardingCoordinator.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 04.08.24.
//


import SwiftUI

// MARK: - OnboardingCoordinator Class
class OnboardingCoordinator: ObservableObject {
    // MARK: - Properties
    @Published var currentPage: OnboardingPage = OnboardingPage.page(for: 1)
    @Published var viewModel: OnboardingViewModel
    // MARK: - Init
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        self.currentPage = .name
    }
    // MARK: - Navigation Control
    /// Moves to the next onboarding page if not the last.
    func nextPage() {
        guard !isLastPage else { return }
        let nextOrder = currentPage.order + 1
        currentPage = OnboardingPage.page(for: nextOrder)
    }
    /// Moves to the previous onboarding page if not the first.
    func previousPage() {
        guard !isFirstPage else { return }
        let previousOrder = currentPage.order - 1
        currentPage = OnboardingPage.page(for: previousOrder)
    }
    // MARK: - Page Check Properties
    /// Checks if the current page is the first in the sequence.
    var isFirstPage: Bool {
        return currentPage.order == 1
    }
    /// Checks if the current page is the last in the sequence.
    var isLastPage: Bool {
        return currentPage.order == OnboardingPage.allCases.count
    }
}
