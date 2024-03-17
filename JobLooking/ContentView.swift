//
//  ContentView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(MyPage.home)
                .navigationDestination(for: MyPage.self) { page in
                    coordinator.getPage(page)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var coordinator = Coordinator()
    static var previews: some View {
        ContentView(coordinator: coordinator)
            .environmentObject(coordinator)
    }
}
