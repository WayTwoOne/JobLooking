//
//  TryCombine.swift
//  JobLooking
//
//  Created by Vladimir on 19.03.2024.
//

import Foundation
import Combine

class JobsListViewModel: ObservableObject {
    
    @Published var jobVacancy = [Vacancy]() 
    @Published var jobOffers = [Offer]()
    @Published var isFavorite = false
    @Published var favoriteVacancy: [Vacancy] = []
    
    @Published var currentVacancy: [Vacancy] = []
    
    @Published var bool = false
    
    var firstThreeElementsArray: [Vacancy] = []
    private var cancellableSet: Set<AnyCancellable> = []
    
    
    
    init() {
        NetworkService.shared.fetchDataWithCombine()
            
            .assign(to: \.jobVacancy, on: self)
            .store(in: &self.cancellableSet)

        NetworkService.shared.fetchDataWithCombine()
            .assign(to: \.jobOffers, on: self)
            .store(in: &self.cancellableSet)

    }

    
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
    
    func emptyFavoriteVacancysArray(vacancy: Vacancy) -> Bool {
        favoriteVacancy.isEmpty ? true : false
    }
            
    func doIHaveThisVacancy(vacancy: Vacancy) -> Bool {
        var bool = false
        for myFavorite in favoriteVacancy {
            if vacancy.id == myFavorite.id {
                bool = true
            } else {
                bool = false
            }
        }
        return bool
    }
            

    
    func iLikeThisVacancy(vacancy: Vacancy) {
        favoriteVacancy.append(vacancy)
        print(vacancy.id)
    }
    
    func iDontLikeThisVacancy(vacancy: Vacancy) {
        self.favoriteVacancy = favoriteVacancy.filter { $0.id != vacancy.id }
        print(vacancy.id)
    }
    
    func pushToCurrentVacancy(coordinator: Coordinator) {
        coordinator.push(.currentVacansy)
    }
    
    func appendToCurrent(vacancy: Vacancy) {
        currentVacancy.append(vacancy)
    }
    
    func removeCurrentVacancy() {
        currentVacancy.removeLast()
    }
    
//MARK: declination of month
    func dateFormatter(vacancy: Vacancy) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.date(from: vacancy.publishedDate)
        dateFormatter.setLocalizedDateFormatFromTemplate("d MMMM")
        return dateFormatter.string(from: newDate!)
    }
    
    
}
