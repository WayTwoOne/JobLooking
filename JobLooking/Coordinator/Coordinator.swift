//
//  Coordinator.swift
//  JobLooking
//
//  Created by Vladimir on 17.03.2024.
//

import SwiftUI

final class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var page: MyPage = .home
    @Published var sheet: MySheet?
    
    let helper = Helper()
    let enteringTheReceivedCodeViewModel = EnteringTheReceivedCodeViewModel(numberOfFields: 4)
    
    func goHome(){
        path.removeLast(path.count)
    }
    
    func goToEnteringTheReceivedCodeView() {
        path.append(MyPage.receivedCode)
    }
    
    func goToJobList() {
        path.append(MyPage.vacansy)
    }
    
    func goToCurrentVacansy() {
        path.append(MyPage.currentVacansy)
    }
    
    func goToSelectedVacancies() {
        path.append(MyPage.selectedVacancies)
    }
    
    @ViewBuilder
    func getPage(_ page: MyPage) -> some View {
        switch page {
        case .home:
            PersonalAccountView(helper: helper)
        case .receivedCode:
            EnteringTheReceivedCodeView(viewModel: self.enteringTheReceivedCodeViewModel, helper: helper)
        case .vacansy:
            VacansyView(helper: helper)
        case .currentVacansy:
            PersonalAccountView(helper: helper)
        case .selectedVacancies:
            PersonalAccountView(helper: helper)
        }
    }
    
    @ViewBuilder
    func getSheet(_ sheet: MySheet) -> some View {
        switch sheet {
        case .popup:
            JobSearchView(helper: helper)
        }
    }
}

enum MyPage: String, CaseIterable, Identifiable {
    case home, receivedCode, vacansy, currentVacansy, selectedVacancies
    
    var id: String { self.rawValue }
}

enum MySheet: String, CaseIterable, Identifiable {
    case popup
    
    var id: String { self.rawValue }
}


