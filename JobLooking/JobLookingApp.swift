//
//  JobLookingApp.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

@main
struct JobLookingApp: App {
//    let jobSearchViewModel = JobSearchViewModel()
//    let vacansyViewModel = JobsListViewModel()
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environmentObject(jobSearchViewModel)
//                .environmentObject(vacansyViewModel)
//        }
//    }
    
    var body: some Scene {
            WindowGroup {
                VacansyView(helper: Helper())
            }
        }
}
