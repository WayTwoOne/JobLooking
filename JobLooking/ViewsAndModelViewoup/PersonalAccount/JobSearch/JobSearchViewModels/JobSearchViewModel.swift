//
//  JobSearchViewModel.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import Foundation

public class JobSearchViewModel: ObservableObject {
    
    @Published var isEdittingChenged = false
    @Published var isEmailCorrect = true
    @Published var isEnvelopeFlewAway = false
    @Published var ableOrDisableButton = true
    @Published var userEmail = ""
    
//MARK: TextField func
    
    func checkEmailAdress(email: String) -> Bool {
        if email.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    func takeUserEmail(email: String) {
        userEmail = email
    }
    
    func emaiFieldIsEditting() {
        isEdittingChenged = true
        isEnvelopeFlewAway = true
    }
    
    func stupiTextFieldIsEditting() {
        isEdittingChenged = true
    }
    
    func emailFieldDidEndEditting() {
        isEdittingChenged = false
    }
    
    func emailCorrect() {
        isEmailCorrect = true
    }
    
    func emailIncorrect() {
        isEmailCorrect = false
    }
    
//MARK: Buttons func
    
    func checkTheEmailFieldNumberOfCharacters(string: String) {
        if !string.isEmpty {
            ableOrDisableButton = false
        } else {
            ableOrDisableButton = true
        }
    }
    
    func goToEnteringTheReceivedCodeView(with coordinator: Coordinator) {
        coordinator.goToEnteringTheReceivedCodeView()
    }
}


