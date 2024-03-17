//
//  TextViewAndIcon.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct TextViewAndIcon: View {
    @ObservedObject var viewModel: JobSearchViewModel
    @FocusState private var hasFocus: Bool
    private let helper = Helper()
    
    let mainWidth = UIScreen.main.bounds.width
    let mainHeight = UIScreen.main.bounds.height
    
    @Binding var textInput: String
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: width, height: height)
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
                        .focused($hasFocus)
                        .keyboardType(.default)
                        .padding()
                        
                        .onTapGesture {
                            viewModel.emaiFieldIsEditting()
                        }
                    
                        .onChange(of: textInput, perform: { newValue in
                            viewModel.checkTheEmailFieldNumberOfCharacters(string: newValue)
                        
                        })
                    
                        .onSubmit {
                            viewModel.checkEmailAdress(email: textInput)
                            ? viewModel.emailCorrect()
                            : viewModel.emailIncorrect()

                            viewModel.emailFieldDidEndEditting()
                        }
                        
                    
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
                .frame(width: width * 1.05, height: height * 1.05)
                .padding(.horizontal)
            }
            Text("Вы ввели неверный e-mail")
                .padding(.trailing, mainWidth / 2.5)
                .font(.subheadline)
                .foregroundColor(.red)
                .frame(height: height / 3)
                .opacity(viewModel.isEmailCorrect || viewModel.isEdittingChenged ? 0 : 1)
        }
    }
}

struct TextViewAndIcon_Previews: PreviewProvider {
    static var previews: some View {
        TextViewAndIcon(viewModel: JobSearchViewModel(), textInput: .constant("Электронная почта или телефон"), width: .constant(340), height: .constant(40))
    }
}
