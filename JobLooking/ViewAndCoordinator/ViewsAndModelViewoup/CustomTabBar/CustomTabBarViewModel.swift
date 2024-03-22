//
//  CustomTabBarViewModel.swift
//  JobLooking
//
//  Created by Vladimir on 21.03.2024.
//

import Foundation

class CustomTabBarViewModel: ObservableObject {
    
    enum Tab: String, CaseIterable {
        case magnifier
        case heart
        case responses
        case messages
        case profile
    }
    
    @Published var tapped: Tab = .magnifier
    
    let allCases = Tab.allCases
    
    func changeTheTappedView(tab: Tab) {
        tapped = tab
    }
    
    func textUnderImage(with tab: Tab) -> String {
        switch tab {
        case .magnifier:
            return "Поиск"
        case .heart:
            return "Избранное"
        case .responses:
            return "Отклики"
        case .messages:
            return "Сообщения"
        case .profile:
            return "Профиль"
        }
    }
}
