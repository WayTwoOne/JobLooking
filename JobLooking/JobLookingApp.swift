//
//  JobLookingApp.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

@main
struct JobLookingApp: App {
    @State var text = ""
//    @State var width = CGFloat(340)
//    @State var height = CGFloat(40)
    var body: some Scene {
        WindowGroup {
            ContentView(coordinator: Coordinator())
        }
    }
}
