//
//  ContentView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var coordinator = Coordinator()
    @EnvironmentObject var jobListViewModel: JobsListViewModel
    @EnvironmentObject var customViewModel: CustomTabBarViewModel
    @StateObject var viewModel = ContentViewModel()
    @State var tab = 1
    
    var body: some View {
        VStack {
            if viewModel.ableOrDisable {
                TabView {
                    NavigationStack(path: $coordinator.path) {
                        coordinator.getPage(.home)
                        
                            .navigationDestination(for: MyPage.self) { page in
                                coordinator.getPage(page)
                            }
                            .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                                coordinator.get(fullScreenCover: item)
                            }
                    }
                    .overlay(alignment: .bottom) {
                        CustomTabBarView(tabSelcted: $tab)
                    }
                    
                    .environmentObject(coordinator)
                    .background(Color.black.ignoresSafeArea())
                }
            } else {
                VStack {
                    TabView(selection: $tab) {
                        NavigationStack(path: $coordinator.path) {
                            coordinator.getPage(.vacancy)
                                .navigationDestination(for: MyPage.self) { page in
                                    coordinator.getPage(page)
                                }
                        }
                        .tag(1)
                        
                        FavoriteJobsView(helper: Helper())
                            .tag(2)
                            .badge("5")
                        
                        Text("Отклики")
                            .tag(3)
                        
                        Text("Сообщения")
                            .tag(4)
                        
                        Text("Профиль")
                            .tag(5)
                    }
                    .overlay(alignment: .bottom) {
                        CustomTabBarView(tabSelcted: $tab)
                    }
                    
                        .environmentObject(coordinator)
                    .background(Color.black.ignoresSafeArea())
                }
            }
        }
        
    }
}
