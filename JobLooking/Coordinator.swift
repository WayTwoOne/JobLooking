//
//  Coordinator.swift
//  JobLooking
//
//  Created by Vladimir on 17.03.2024.
//

import SwiftUI

final class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var fullScreenCover: FullScreenCover?
    
    
    var helper = Helper()
    let enteringTheReceivedCodeViewModel = EnteringTheReceivedCodeViewModel(numberOfFields: 4)
    
    func push(_ page: MyPage) {
        path.append(page)
    }
    
    
    
    func goBack() {
        path.removeLast()
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    func closeTheLogInScreen() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func get(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .receivedCode:
            EnteringTheReceivedCodeView(viewModel: self.enteringTheReceivedCodeViewModel, helper: helper)
        }
    }
    
    @ViewBuilder
    func getPage(_ page: MyPage) -> some View {
        switch page {
        case .home:
            PersonalAccountView(helper: helper)
        case .currentVacansy:
            CurrentVacancyView(viewModel: CurrentVacancyViewModel(), helper: helper)
        case .vacancy:
            VacancyView(helper: helper)
        }
    }
}

enum MyPage: String, CaseIterable, Identifiable {
    case home, currentVacansy, vacancy
    
    var id: String { self.rawValue }
}

enum FullScreenCover: String, CaseIterable, Identifiable {
    case receivedCode
    
    var id: String { self.rawValue }
}


