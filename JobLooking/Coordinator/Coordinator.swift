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
    
    func goHome(){
        path.removeLast(path.count)
    }
    
    func goToEnteringTheReceivedCodeView() {
        path.append(MyPage.receivedCode)
    }
    
    func goToJobList() {
        path.append(MyPage.joblis)
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
            PersonalAccountView(viewModel: JobSearchViewModel(), helper: Helper())
        case .receivedCode:
            EnteringTheReceivedCodeView(viewModel: EnteringTheReceivedCodeViewModel(numberOfFields: 4, jobjobSearchViewModel: JobSearchViewModel()), helper: Helper())
        case .joblis:
            JobListView()
        case .currentVacansy:
            PersonalAccountView(viewModel: JobSearchViewModel(), helper: Helper())
        case .selectedVacancies:
            PersonalAccountView(viewModel: JobSearchViewModel(), helper: Helper())
        }
    }
    
    @ViewBuilder
    func getSheet(_ sheet: MySheet) -> some View {
        switch sheet {
        case .popup:
            JobSearchView(viewModel: JobSearchViewModel(), helper: Helper())
        }
    }
}

enum MyPage: String, CaseIterable, Identifiable {
    case home, receivedCode, joblis, currentVacansy, selectedVacancies
    
    var id: String { self.rawValue }
}

enum MySheet: String, CaseIterable, Identifiable {
    case popup
    
    var id: String { self.rawValue }
}
