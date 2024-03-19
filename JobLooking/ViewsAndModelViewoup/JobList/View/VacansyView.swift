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
            VStack(alignment: .leading) {
                JobOffersView(viewModel: viewModel, helper: helper)
                Text("Вакансии для вас")
                    .font(.headline)
                    .padding(.leading, 18)
//                ScrollView {
//                    ForEach(viewModel.jobVacansy, id: \.title) { job in
//                        Text(job.title)
//                    }
//                    Text("\(viewModel.jobVacansy.count)")
//                        .foregroundColor(.red)
//                }
//                .task {
//                    await viewModel.fetchDataPressed()
//                }
            }
        }
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        VacansyView(helper: Helper())
    }
}
