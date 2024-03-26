//
//  CustomTabBarViewModel.swift
//  JobLooking
//
//  Created by Vladimir on 21.03.2024.
//

import Foundation

class CustomTabBarViewModel: ObservableObject {
    
    let tabBarItems: [(image: String, title: String)] = [
        ("magnifier", "Поиск"),
        ("heart", "Избранное"),
        ("responses", "Отклики"),
        ("messages", "Сообщения"),
        ("profile", "Профиль")
    ]
    
}
