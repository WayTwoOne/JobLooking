//
//  JobListView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct VacansyView: View {
    @StateObject private var viewModel = JobsListViewModel()
    var helper: Helper
    
    var body: some View {
        VStack {
            JobSearchByPositionView(helper: helper)
                .padding(.trailing)
            VStack(alignment: .leading) {
                JobOffersView(viewModel: viewModel, helper: helper)
                Text("Вакансии для вас")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.leading, 18)
                ScrollView() {
                    ForEach(viewModel.firstThreeElementsArray, id: \.title) { job in
                        VacansyCardView(viewModel: viewModel, vacancy: job, helper: helper)
                            .padding(.horizontal)
                    }
                    
                    SwiftUI.Button(action: {}) {
                        Text(viewModel.jobVacansy.count.vacancy())
                            .font(.system(size: 15))
                            .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.05, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .task {
                    await viewModel.fetchDataPressed()
                }
            }
        }
        .background {
            Color.black
                .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)
                .ignoresSafeArea()
        }
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        VacansyView(helper: Helper())
    }
}
