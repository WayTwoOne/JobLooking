//
//  ButtonsView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct ButtonsView: View {
    @ObservedObject var viewModel: JobSearchViewModel
    private let helper = Helper()

    @Binding var textInput: String
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        HStack(spacing: screen.width / 35) {
            SwiftUI.Button(action: {
                    viewModel.emailFieldDidEndEditting()
                if viewModel.checkEmailAdress(email: textInput) {
                    viewModel.emailCorrect()
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
        })
        .frame(width: width, height: height)
    }
    
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(viewModel: JobSearchViewModel(), textInput: .constant("Text"), width: .constant(200), height: .constant(50))
    }
}
