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
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(jobSearchViewModel)
        }
    }
}
