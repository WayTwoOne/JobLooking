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

//extension Int {
//     func days() -> String {
//         var dayString: String!
//         if "1".containsString("\(self % 10)")      {dayString = "день"}
//         if "234".containsString("\(self % 10)")    {dayString = "дня" }
//         if "567890".containsString("\(self % 10)") {dayString = "дней"}
//         if 11...14 ~= self % 100                   {dayString = "дней"}
//    return "\(self) " + dayString
//    }
//}
