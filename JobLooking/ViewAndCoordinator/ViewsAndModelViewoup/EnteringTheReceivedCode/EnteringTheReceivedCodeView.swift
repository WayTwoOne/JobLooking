//
//  EnteringTheReceivedCodeView.swift
//  JobLooking
//
//  Created by Vladimir on 17.03.2024.
//

import SwiftUI

struct EnteringTheReceivedCodeView: View {
    @StateObject var viewModel = EnteringTheReceivedCodeViewModel(numberOfFields: 4)
    @EnvironmentObject var jobViewModel: JobSearchViewModel
    @EnvironmentObject var contentViewModel: ContentViewModel
    @EnvironmentObject private var coordinator: Coordinator
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
                    Text("Отправили код на \(jobViewModel.userEmail)")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .lineLimit(1)
                    Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    PinCodeTextFieldView(viewModel: viewModel, helper: Helper())
                        
                }
                .padding(.trailing)
                .frame(width: width)
                
                SwiftUI.Button(action: {
                    viewModel.dismissTheEnteringCodeView(with: coordinator)
                    contentViewModel.changeTheViews()
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
            .background {
                Color.black
                    .ignoresSafeArea()
            }
            .frame(width: width)
        }
        .frame(width: width)
    }
    
}

//struct EnteringTheReceivedCodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        let jobViewModel = JobSearchViewModel()
//        EnteringTheReceivedCodeView(viewModel: EnteringTheReceivedCodeViewModel(numberOfFields: 4), helper: Helper())
//            .environmentObject(jobViewModel)
//    }
//}
