//
//  CurrentVacancyViewModel.swift
//  JobLooking
//
//  Created by Vladimir on 20.03.2024.
//

import Foundation

class CurrentVacancyViewModel: ObservableObject {
    
    let imageNames = ["eye", "share", "heart"]
    
    @Published var currentVacancy: [Vacancy] = []
    
    func typeOfEmployment(with schedules: [String]) -> String {
        var fullTypeOfEmployment = ""
        for index in 0..<schedules.count - 1 {
            if index == 0 {
                fullTypeOfEmployment = schedules[index].capitalized
            } else {
                fullTypeOfEmployment += ", \(schedules[index])"
            }
        }
        return fullTypeOfEmployment
    }
    
    func appendToCurrent(vacancy: Vacancy) {
        currentVacancy.append(vacancy)
    }
    
    func fullAdress(from vacancy: Vacancy) -> String {
        "\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)"
    }
    
    func quastionFiledsFrame(with string: String) -> CGFloat {
        CGFloat(string.count + 5)
    }
    
    func goBackToVacancyList(with coordinator: Coordinator) {
        coordinator.goBack()
    }
}
