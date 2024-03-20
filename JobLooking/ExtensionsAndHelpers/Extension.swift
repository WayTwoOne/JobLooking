//
//  Extention.swift
//  JobLooking
//
//  Created by Vladimir on 16.03.2024.
//

import SwiftUI

//MARK: extention Int
extension Int {
    func people() -> String {
        var peopleString: String?
        var fullString: String?
        
        if String(self) != "0" {
            if "1".contains("\(self % 10)")         {peopleString = "человек"}
            if "234".contains("\(self % 10)")       {peopleString = "человека"}
            if "567890".contains("\(self % 10)")    {peopleString = "человек"}
            
            fullString = "\(self) " + (peopleString ?? "")
        } else {
            return ""
        }
        return "Сейчас просматривает \(fullString ?? "")"
    }
    
    func vacancy() -> String {
        var vacancy: String?

            if "1".contains("\(self % 10)")         {vacancy = "вакансия"}
            if "234".contains("\(self % 10)")       {vacancy = "вакансии"}
            if "567890".contains("\(self % 10)")    {vacancy = "вакансий"}
        
        return "Еще \(self) \(vacancy ?? "")"
    }
}

//MARK: extention View
extension View {
    func sync<T: Equatable>(_ binding: Binding<T>, with focusState: FocusState<T>) -> some View {
        self
            .onChange(of: binding.wrappedValue) {
                focusState.wrappedValue = $0
            }
            .onChange(of: focusState.wrappedValue) {
                binding.wrappedValue = $0
            }
    }
}

extension Image {
    func heart(name: String) -> some View {
        let image = Image(name)
        return image.resizable().frame(width: 20, height: 20)
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        
        navigationBar.standardAppearance = appearance
    }
}

extension UITabBarController {
    override open func viewDidLoad() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .black
        
        tabBar.standardAppearance = appearance
    }
}
