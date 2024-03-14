//
//  JobLookingApp.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

@main
struct JobLookingApp: App {
    var body: some Scene {
        WindowGroup {
            JobSearchView(textinput: .constant("Text"))
        }
    }
}
