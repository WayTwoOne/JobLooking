//
//  ContentView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        TabView {
            NavigationStack(path: $coordinator.path) {
                coordinator.getPage(MyPage.home)
                    .navigationDestination(for: MyPage.self) { page in
                        coordinator.getPage(page)
                    }
            }
            .tabItem {
                SwiftUI.Button {
                    coordinator.goToEnteringTheReceivedCodeView()
                } label: {
                    Image("Magnifier")
                        .background(Color.gray)
                    Text("Главная")
                }
            }
            
            EnteringTheReceivedCodeView(viewModel: coordinator.enteringTheReceivedCodeViewModel, helper: coordinator.helper)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Каталог")
                }
               
            
            VacansyView(helper: coordinator.helper)
                .tabItem {
                    
                    Image(systemName: "Mail")
                    Text("Корзина")
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "Message")
                    Text("Профиль")
                }
            Text("")
                .tabItem {
                    Image(systemName: "Person")
                    Text("Профиль")
                }
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = .black
        }
        .environmentObject(coordinator)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
