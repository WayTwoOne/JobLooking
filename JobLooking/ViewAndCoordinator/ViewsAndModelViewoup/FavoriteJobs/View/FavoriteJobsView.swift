//
//  FavoriteJobsView.swift
//  JobLooking
//
//  Created by Vladimir on 25.03.2024.
//

import SwiftUI

struct FavoriteJobsView: View {
    @EnvironmentObject var jobListViewModel: JobsListViewModel
    let helper: Helper
    var body: some View {
        NavigationView() {
            VStack(alignment: .leading, spacing: 10) {
                Text(jobListViewModel.favoriteVacancy.count.vacancy())
                    .foregroundColor(helper.gray)
                    .font(.system(size: 15))
                ScrollView() {
                    ForEach(jobListViewModel.favoriteVacancy, id: \.title) { job in
                        VacansyCardView(viewModel: jobListViewModel, vacancy: job, helper: helper)
                    }
                }
            }
            .navigationTitle("Избранное")
            .foregroundColor(.white)
        }
    }
}
