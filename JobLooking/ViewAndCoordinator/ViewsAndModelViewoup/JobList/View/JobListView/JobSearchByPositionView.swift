//
//  JobSearchByPositionView.swift
//  JobLooking
//
//  Created by Vladimir on 18.03.2024.
//

import SwiftUI

struct JobSearchByPositionView: View {
    @State private var textInput = ""
    let helper: Helper
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(width: width * 0.75, height: height * 0.05)
                    .foregroundColor(helper.gray)
                    .cornerRadius(10)
                HStack(alignment: .center) {
                    Image("magnifier")
                        .resizable()
                        .frame(width: 24.2, height: 23.2)
                        .foregroundColor(.white)
                    
                    TextField("Должность, ключевые слова", text: $textInput)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .background(helper.gray)
                        .frame(width: 250)
                        .textContentType(.oneTimeCode)
                        .keyboardType(.default)
                    
                    
                }
            }
            SwiftUI.Button(action: {}) {
                ZStack {
                    Rectangle()
                        .frame(width: width * 0.14, height: height * 0.05)
                        .cornerRadius(10)
                        .foregroundColor(helper.gray)
                    Image("Union")
                }
            }
        }
    }
}

struct JobSearchByPositionView_Previews: PreviewProvider {
    static var previews: some View {
        JobSearchByPositionView(helper: Helper())
    }
}
