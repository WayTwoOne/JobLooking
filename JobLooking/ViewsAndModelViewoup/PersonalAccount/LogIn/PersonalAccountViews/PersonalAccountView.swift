//
//  SwiftUIView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct PersonalAccountView: View {
    @ObservedObject var viewModel: JobSearchViewModel
    let helper: Helper
    
    var body: some View {
        ZStack {
            NavigationView() {
                ScrollView {
                    Spacer(minLength: 150)
                    JobSearchView(viewModel: viewModel, helper: helper)
                    SearchForEmployeesView()
                }
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Вход в личный кабинет")
                            .font(.title2).fontWeight(.bold)
                            .foregroundColor(.white)
                    })
                    
                })
                .background {
                    Color.black
                        .ignoresSafeArea()
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalAccountView(viewModel: JobSearchViewModel(), helper: Helper())
    }
}
