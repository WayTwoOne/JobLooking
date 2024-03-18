//
//  EnteringTheReceivedCodeViewMode.swift
//  JobLooking
//
//  Created by Vladimir on 16.03.2024.
//

import Foundation

class EnteringTheReceivedCodeViewModel: ObservableObject {
    
    @Published var pinCode: [String] = [""]
    @Published var hasFocus: Int?
    @Published var isButtonDisable = true
    @Published var email = ""
    
    let numberOfFields: Int
    
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.pinCode = Array(repeating: "", count: numberOfFields)
    }
    
    func onlyNumbers(index: Int, newValue: String) {
        pinCode[index] = newValue.filter {
            "0123456789".contains($0)
        }
    }
    
    func onlyOneDigitInTheField(index: Int) {
        if pinCode[index].count > 1 {
            pinCode[index] = String(pinCode[index].suffix(1))
        }
    }
    

    func stepLeftStepRightAcrossTheFields(newValue: String, index: Int) {
        if !newValue.isEmpty {
            if index == numberOfFields - 1 {
                hasFocus = nil
            } else {
                hasFocus = (hasFocus ?? 0) + 1
            }
        } else if index == 0 {
            hasFocus = index
        } else {
            hasFocus = (hasFocus ?? 0) - 1
        }
    }
    
//MARK: Button function
    
    func ableButton() {
        for field in pinCode {
            if Int(field) != nil {
                isButtonDisable = false
            } else {
                isButtonDisable = true
                return
            }
        }
    }
    
    func goToEnteringTheReceivedCodeView(with coordinator: Coordinator) {
        coordinator.goToJobList()
    }
}
