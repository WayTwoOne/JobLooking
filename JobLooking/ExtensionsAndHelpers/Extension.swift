//
//  Extention.swift
//  JobLooking
//
//  Created by Vladimir on 16.03.2024.
//

import SwiftUI


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

extension Int {
    func people() -> String {
        var peopleString: String?
        var fullString: String?
        
        if String(self) != "0" {
            if "0".contains("\(self % 10)")      {peopleString = "человек"}
            if "01".contains("\(self % 10)")      {peopleString = "человек"}
            if "234".contains("\(self % 10)")    {peopleString = "человека"}
            if 5...20 ~= self % 100              {peopleString = "человек"}
            fullString = "\(self) " + (peopleString ?? "")
        } else {
            return ""
        }
        return "Сейчас просматривает \(fullString ?? "")"
    }
}

extension String {
    func dateFormatter() -> String {
        
        var date: String?
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        print(date)
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMMM"
        
        guard let date = dateFormatterGet.date(from: date ?? "") else { return ""}
        print(dateFormatterPrint.string(from: date))
        return dateFormatterPrint.string(from: date)
    }
}
