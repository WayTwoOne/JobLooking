//
//  ButtonsView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct ButtonsView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel: JobSearchViewModel
    var helper: Helper

    @Binding var textInput: String
    
    let screen = UIScreen.main.bounds
    
    let rectangleWidth = UIScreen.main.bounds.width * 0.88
    let rectanglHeight = UIScreen.main.bounds.height * 0.05
    
    var body: some View {
        HStack(spacing: screen.width / 35) {
            SwiftUI.Button(action: {
                    viewModel.emailFieldDidEndEditting()
                if viewModel.checkEmailAdress(email: textInput) {
                    viewModel.takeUserEmail(email: textInput)
                    viewModel.emailCorrect()
                    viewModel.goToEnteringTheReceivedCodeView(with: coordinator)
                } else {
                    viewModel.emailIncorrect()
                }
            }, label: {
                Text("Продолжить")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
            })
            
            .disabled(viewModel.ableOrDisableButton)
            .frame(width: 177, height: 40)
            .background(viewModel.ableOrDisableButton ? helper.bluedisable : helper.blueAble)
            .cornerRadius(10)
            .padding(.trailing)
            
            SwiftUI.Button(action: {}) {
                Text("Войти с паролем")
                    .foregroundColor(helper.blueAble)
                    .font(.system(size: 15))
            }
            .frame(width: 130, height: 40)
            .padding(.leading)
            
        }
        .onChange(of: textInput, perform: { newValue in
            viewModel.checkTheEmailFieldNumberOfCharacters(string: newValue)
            viewModel.takeUserEmail(email: newValue)
        })
        .frame(width: rectangleWidth, height: rectanglHeight)
    }
    
}

//struct ButtonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonsView(viewModel: JobSearchViewModel(), helper: Helper(), textInput: .constant("Text"))
//    }
//}
