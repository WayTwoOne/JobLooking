//
//  JobSearchView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct JobSearchView: View {
    
    @ObservedObject private var viewModel = JobSearchViewModel()
    var helper = Helper()
    
    @State private var textinput = ""
    
    @State private var mainWidth = UIScreen.main.bounds.width * 0.95
    @State private var mainHeight = UIScreen.main.bounds.height * 0.23

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
                    TextViewAndIcon(textInput: $textinput, width: $rectangleWidth, height: $rectanglHeight)
                    ButtonsView(width: $rectangleWidth, height: $rectanglHeight)
                        .padding([.leading, .trailing], mainWidth - rectangleWidth)
                }
            }
            SearchForEmployeesView()
        }
    }
}

struct JobSearchView_Previews: PreviewProvider {
    static var previews: some View {
        JobSearchView()
    }
}
