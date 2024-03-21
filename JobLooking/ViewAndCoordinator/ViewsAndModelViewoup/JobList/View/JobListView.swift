//
//  JobListView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct VacansyView: View {
    @ObservedObject private var viewModel = JobsListViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.jobVacansy, id: \.title) { job in
                Text(job.title)
            }
            Text("\(viewModel.jobVacansy.count)")
                .foregroundColor(.red)
        }
        .navigationTitle("Job")
        .task {
            await viewModel.fetchDataPressed()
        }
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        VacansyView()
    }
}
