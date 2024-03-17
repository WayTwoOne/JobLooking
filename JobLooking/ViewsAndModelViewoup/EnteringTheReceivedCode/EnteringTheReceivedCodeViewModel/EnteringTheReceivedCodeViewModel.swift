//
//  EnteringTheReceivedCodeViewMode.swift
//  JobLooking
//
//  Created by Vladimir on 16.03.2024.
//

import Foundation

class EnteringTheReceivedCodeViewModel: ObservableObject {
    
    @Published var pinCode: [String] = [""]
    @Published var oldValue = ""
    @Published var hasFocus: Int?
    @Published var isButtonDisable = true
    
    var counter = 0
    let numberOfFields: Int
    
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.pinCode = Array(repeating: "", count: numberOfFields)
    }
    
    
    func onlyOneDigitInTheField(index: Int) {
        if pinCode[index].count > 1 {
            let currentValue = Array(pinCode[index])
            
            if currentValue[0] == Character(oldValue) {
                pinCode[index] = String(pinCode[index].suffix(1))
            } else {
                pinCode[index] = String(pinCode[index].prefix(1))
            }
        }
    }
    
    func stepLeftStepRightAcrossTheFields(newValue: String, index: Int) {
        if !newValue.isEmpty {
            if index == numberOfFields - 1 {
                hasFocus = nil
            } else {
                hasFocus = (hasFocus ?? 0) + 1
            }
        } else {
            hasFocus = (hasFocus ?? 0) - 1
        }
    }
    
    func onlyNumbers(index: Int, newValue: String) {
        pinCode[index] = newValue.filter {
            "0123456789".contains($0)
            
        }
    }
    
    func dontMoveIfItString(index: Int) {
        if Int(pinCode[index]) == nil {
            hasFocus = nil
        }
    }
    
    
    
    
    //MARK: New functions
    func stepLeftStepRight(index: Int, newValue: String) {
        
        if !newValue.isEmpty {
            if index == numberOfFields - 1 {
                hasFocus = nil
            } else {
                hasFocus = (hasFocus ?? 0) + 1
            }
        } else {
            hasFocus = (hasFocus ?? 0) - 1
        }
    }
    
    func oneSufix(index: Int) {
        if pinCode[index].count > 1 {
            pinCode[index] = String(pinCode[index].suffix(1))
        }
    }
    
    func ableButton() {
        print(counter)
        if counter == 4 {
            
            isButtonDisable = false
            print(isButtonDisable)
        }
        
    }
}
