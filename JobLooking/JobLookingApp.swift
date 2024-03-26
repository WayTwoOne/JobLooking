//
//  JobLookingApp.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

@main
struct JobLookingApp: App {
    let jobSearchViewModel = JobSearchViewModel()
    let vacansyViewModel = JobsListViewModel()
    let currentViewModel = CurrentVacancyViewModel()
    let customTabViewModel = CustomTabBarViewModel()
    let contentViewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: contentViewModel)
                .environmentObject(jobSearchViewModel)
                .environmentObject(vacansyViewModel)
                .environmentObject(currentViewModel)
                .environmentObject(customTabViewModel)
                .environmentObject(contentViewModel)
                .environment(\.colorScheme, .dark)
        }
    }
}
