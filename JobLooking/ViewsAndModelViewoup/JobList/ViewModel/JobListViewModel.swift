//
//  JobListViewModel.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import Foundation
import Combine

class JobsListViewModel: ObservableObject {
    @Published var jobVacansy = [Vacancy]()
    @Published var jobOffers = [Offer]()
    
    func fetchDataPressed() async {
        do {
            let job = try await NetworkService.shared.fetchJob()
            self.jobOffers = job.offers
            self.jobVacansy = job.vacancies
        } catch {
            print(error)
        }
    }
    
    func withoutUnnecessarySpaces(with title: String) -> String {
        var newTitle = title
        print(newTitle.first)
        if newTitle.first == " " {
            newTitle.removeFirst()
            print(newTitle)
        } else {
            return newTitle
        }
        
        return withoutUnnecessarySpaces(with: newTitle)
    }
}
