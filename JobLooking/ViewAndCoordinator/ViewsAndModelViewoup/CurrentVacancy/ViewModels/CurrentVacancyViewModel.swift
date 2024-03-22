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
        for sentense in schedules {
            if fullTypeOfEmployment.isEmpty {
                fullTypeOfEmployment = sentense.prefix(1).uppercased() + sentense.dropFirst()
            } else {
                fullTypeOfEmployment += ", \(sentense)"
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

//MARK: Frame func
    
//    func lookingWidth(lookking: Int?, width: CGFloat) -> CGFloat {
//        lookking == nil ? width * 0.9 : width * 0.45
//    }
//    func responceWidth(responce: Int?, width: CGFloat) -> CGFloat {
//        responce == nil ? width * 0.0 : width * 0.45
//    }
    
    func responceFrame(looking: Int?, responce: Int?, width: CGFloat) -> CGFloat {
        var frame: CGFloat = 0
        if responce == nil && looking == nil {
            frame *= width
        } else if responce == nil {
            frame = width * 0
        } else {
            frame = width * 0.45
        }
        return frame
    }
    
    func lookingFrame(looking: Int?, responce: Int?, width: CGFloat) -> CGFloat {
        var frame: CGFloat = 0
        if responce == nil && looking == nil {
            frame *= width
        } else if looking == nil {
            frame = width * 0
        } else {
            frame = width * 0.45
        }
        return frame
    }
    
    
    
    func widthOf(question: String,and width: CGFloat ) -> CGFloat {
        return width * CGFloat(Double(question.count) * 0.0229) + (width * 0.05)
    }
    
    func goBackToVacancyList(with coordinator: Coordinator) {
        coordinator.goBack()
    }
}
