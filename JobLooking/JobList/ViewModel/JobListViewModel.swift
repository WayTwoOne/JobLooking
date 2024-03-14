//
//  JobListViewModel.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

class JobsListViewModel: ObservableObject {
    @Published var jobVacansy = [Vacancy]()

    
    
    func fetchDataPressed() async {
        do {
            let job = try await NetworkService.shared.fetchJob()
            self.jobVacansy = job.vacancies
        } catch {
            print(error)
        }
    }
}
