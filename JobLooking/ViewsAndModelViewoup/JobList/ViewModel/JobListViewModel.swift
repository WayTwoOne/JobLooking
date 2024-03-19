//
//  JobListViewModel.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import Foundation
import Combine

@MainActor class JobsListViewModel: ObservableObject {
    @Published var jobVacansy: [Vacancy] = []
    @Published var jobOffers: [Offer] = []
    @Published var isFavorite = false
    
    @Published var favoriteVacancy: [Vacancy] = []
    
    var firstThreeElementsArray: [Vacancy] = []
    
    func fetchDataPressed() async {
        do {
            let job = try await NetworkService.shared.fetchJob()
            self.jobOffers = job.offers
            self.jobVacansy = job.vacancies
            self.onlyFirstThreeElementsInArray(with: job.vacancies)
        } catch {
            print(error)
        }
    }
 
//MARK: for JobOffersView func
    func withoutUnnecessarySpaces(with title: String) -> String {
        var newTitle = title
        if newTitle.first == " " {
            newTitle.removeFirst()
        } else {
            return newTitle
        }
        
        return withoutUnnecessarySpaces(with: newTitle)
    }

//MARK: for VacansyView func
    func onlyFirstThreeElementsInArray(with vacansy: [Vacancy]) {
        for index in 0..<3 {
            firstThreeElementsArray.append(vacansy[index])
        }
    }
    
//MARK: for VacansyCardView func
    
    func hightOFTextField(with vacancy: Vacancy, and height: CGFloat) -> CGFloat {
        vacancy.title.count >= 29 ? height * 0.05 : height * 0.01
    }
    
    func isSomeoneLokingAt(_ vacancy: Vacancy) -> Bool {
        vacancy.lookingNumber != nil ? true : false
    }
    
    func isTheFeeSpecified(in vacancy: Vacancy) -> Bool {
        vacancy.salary.short != nil ? true : false
    }
    
    func rectangleHeight(_ vacancy: Vacancy, and height: CGFloat) -> CGFloat {
        var distance = CGFloat(10)
        if vacancy.lookingNumber != nil && vacancy.salary.short != nil && vacancy.title.count <= 29 {
            distance = height * 0.29
        } else if vacancy.lookingNumber != nil && vacancy.salary.short != nil {
            distance = height * 0.34
        } else if vacancy.lookingNumber != nil && vacancy.salary.short == nil {
            distance = height * 0.27
        } else if vacancy.lookingNumber == nil &&  vacancy.salary.short == nil {
            distance = height * 0.25
        } else if vacancy.lookingNumber == nil && vacancy.salary.short != nil {
            distance = height * 0.21
        }
        
        return distance
    }
    
    func paddingHeightBetweenTitleAndSalaryShort(_ vacancy: Vacancy, height: CGFloat) -> CGFloat {
        var distance = CGFloat(10)
        if vacancy.lookingNumber != nil && vacancy.salary.short != nil {
            distance = height * 0.33
        } else if vacancy.lookingNumber != nil && vacancy.salary.short == nil {
            distance = height * 0.26
        } else if vacancy.lookingNumber == nil &&  vacancy.salary.short == nil {
            distance = height * 0.18
        } else if vacancy.lookingNumber == nil && vacancy.salary.short != nil {
            distance = height * 0.2
        }
        
        return distance
    }
    
    
    func myFavorite(vacancy: Vacancy) {
        isFavorite = true
        favoriteVacancy.append(vacancy)
    }
    
    func unloved(vacancy: Vacancy) {
        favoriteVacancy.filter { $0.id != vacancy.id }
    }
    
    private let user = UserDefaults()
    
//MARK: declination of month
    func dateFormatter(with string: String?) -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMMM"
        
        guard let date = dateFormatterGet.date(from: string ?? "") else { return ""}
        
        return dateFormatterPrint.string(from: date)
    }
    
    func tryDateFromString(vacancy: Vacancy) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.date(from: vacancy.publishedDate)
        dateFormatter.setLocalizedDateFormatFromTemplate("d MMMM")
        return dateFormatter.string(from: newDate!)
    }
    
    
}
