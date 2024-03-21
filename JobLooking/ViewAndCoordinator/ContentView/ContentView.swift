//
//  ContentView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var coordinator = Coordinator()
    @EnvironmentObject var customViewModel: CustomTabBarViewModel
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            if viewModel.ableOrDisable {
                VStack {
                    NavigationStack(path: $coordinator.path) {
                        coordinator.getPage(.home)
                        
                            .navigationDestination(for: MyPage.self) { page in
                                coordinator.getPage(page)
                            }
                            .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                                coordinator.get(fullScreenCover: item)
                            }
                    }
                    CustomTabBarView(viewModel: customViewModel)
                }
                .environmentObject(coordinator)
                .background(Color.black.ignoresSafeArea())
            } else {
                VStack {
                        NavigationStack(path: $coordinator.path) {
                            coordinator.getPage(.vacancy)
                                .navigationDestination(for: MyPage.self) { page in
                                    coordinator.getPage(page)
                                }
                        }
                        .environmentObject(coordinator)
                    .background(Color.black.ignoresSafeArea())
                }
            }
        }
        
    }
}
