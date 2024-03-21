//
//  JobSearchView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct JobSearchView: View {
    @StateObject var viewModel = JobSearchViewModel()
    let helper: Helper
    
    @State private var textinput = ""
    
    private let mainWidth = UIScreen.main.bounds.width * 0.95
    private let mainHeight = UIScreen.main.bounds.height * 0.23

    @State private var rectangleWidth = UIScreen.main.bounds.width * 0.88
    @State private var rectanglHeight = UIScreen.main.bounds.height * 0.05
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: mainWidth, height: mainHeight)
                    .foregroundColor(helper.mainRectangleColor)
                    .cornerRadius(15)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Поиск работы")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(alignment: .leading)
                        .padding(.leading, mainWidth - rectangleWidth)
                        .padding(.bottom, 10)
                    TextViewAndIcon(viewModel: viewModel, helper: helper, textInput: $textinput)
                    ButtonsView(viewModel: viewModel, helper: helper, textInput: $textinput)
                        .padding([.leading, .trailing], mainWidth - rectangleWidth)
                }
            }
            
            .onChange(of: textinput) { newValue in
                viewModel.takeUserEmail(email: newValue)
                
            }
            
        }
    }
}

//struct JobSearchView_Previews: PreviewProvider {
//    @State static var viewModel = JobSearchViewModel()
//    static var previews: some View {
//        JobSearchView(helper: Helper())
//            .environmentObject(viewModel)
//    }
//}
