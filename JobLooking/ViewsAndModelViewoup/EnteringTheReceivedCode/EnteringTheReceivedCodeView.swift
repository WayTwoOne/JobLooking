//
//  EnteringTheReceivedCodeView.swift
//  JobLooking
//
//  Created by Vladimir on 17.03.2024.
//

import SwiftUI

struct EnteringTheReceivedCodeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel:  EnteringTheReceivedCodeViewModel
    let helper: Helper
    
    @State private var width = UIScreen.main.bounds.width * 0.9
    @State private var height = UIScreen.main.bounds.height * 0.05
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width)
            VStack(spacing: 15) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Отправили код на \(viewModel.jobSearchViewModel.userEmail)")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    PinCodeTextFieldView(helper: Helper(), viewModel: viewModel)
                        
                }
                .padding(.trailing)
                .frame(width: width)
                
                SwiftUI.Button(action: {
                    viewModel.goToEnteringTheReceivedCodeView(with: coordinator)
                }, label: {
                    Text("Продолжить")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                })
                .disabled(viewModel.isButtonDisable)
                          
                .frame(width: width, height: height)
                .background(viewModel.isButtonDisable ? helper.bluedisable : helper.blueAble)
                .cornerRadius(10)
            }
            
            .onChange(of: viewModel.isButtonDisable, perform: { newValue in
                viewModel.ableButton()
            })
            .frame(width: width)
        }
        .frame(width: width)
        
    }
    
}

struct EnteringTheReceivedCodeView_Previews: PreviewProvider {
    static var previews: some View {
        EnteringTheReceivedCodeView(viewModel: EnteringTheReceivedCodeViewModel(numberOfFields: 4, jobjobSearchViewModel: JobSearchViewModel()), helper: Helper())
    }
}
