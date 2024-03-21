//
//  TextViewAndIcon.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct TextViewAndIcon: View {
    @ObservedObject var viewModel: JobSearchViewModel
    var helper: Helper
    
    let mainWidth = UIScreen.main.bounds.width
    let mainHeight = UIScreen.main.bounds.height
    
    @Binding var textInput: String
    private let rectangleWidth = UIScreen.main.bounds.width * 0.88
    private let rectanglHeight = UIScreen.main.bounds.height * 0.05
    
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: rectangleWidth, height: rectanglHeight)
                    .foregroundColor(helper.gray)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: CGFloat(15))
                        .stroke(viewModel.isEmailCorrect || viewModel.isEdittingChenged ? helper.gray: Color.red, lineWidth: 2))
                    .cornerRadius(15)
                    .clipped()
                    .shadow(color: Color.black, radius: 5, x: 0, y: 4)
                
                HStack(alignment: .center, spacing: -5) {
                    Image("Envelope")
                        .resizable()
                        .frame(width: 24.2, height: 23.2)
                        .padding(.leading, viewModel.isEnvelopeFlewAway ? -20 : 15)
                        
                        .opacity(viewModel.isEnvelopeFlewAway ? 0 : 1)
                    
                    TextField("Электронная почта или телефон", text: $textInput)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .background(helper.gray)
                        .frame(height: 30)
                        .textContentType(.oneTimeCode)
                        .keyboardType(.emailAddress)
                        .padding()
                        
                        .onTapGesture {
                            viewModel.emaiFieldIsEditting()
                        }
                    
                        .onChange(of: textInput, perform: { newValue in
                            viewModel.checkTheEmailFieldNumberOfCharacters(string: newValue)
                        })
                        
                    
                    SwiftUI.Button(action: {
                        textInput = ""
                        viewModel.stupiTextFieldIsEditting()
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15.2, height: 15.2)
                            .foregroundColor(helper.xmarkColor)
                            .padding(.trailing)
                    })
                    .opacity(viewModel.isEnvelopeFlewAway ? 1 : 0)
                    .disabled(viewModel.isEnvelopeFlewAway ? false : true)
                }
                .frame(width: rectangleWidth * 1.05, height: rectanglHeight * 1.05)
                .padding(.horizontal)
            }
            Text("Вы ввели неверный e-mail")
                .padding(.trailing, mainWidth / 2.5)
                .font(.subheadline)
                .foregroundColor(.red)
                .frame(height: rectanglHeight / 3)
                .opacity(viewModel.isEmailCorrect || viewModel.isEdittingChenged ? 0 : 1)
        }
    }
}

struct TextViewAndIcon_Previews: PreviewProvider {
    static var previews: some View {
        TextViewAndIcon(viewModel: JobSearchViewModel(), helper: Helper(), textInput: .constant("Электронная почта или телефон"))
    }
}
