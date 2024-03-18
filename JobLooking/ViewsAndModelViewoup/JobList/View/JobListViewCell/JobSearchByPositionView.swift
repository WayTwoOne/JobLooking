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
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(width: width * 0.9, height: height + 5)
                    .foregroundColor(helper.gray)
                    .cornerRadius(10)
                HStack(alignment: .center) {
                    Image("Magnifier")
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
                        .frame(width: width * 0.11, height: height * 1.1)
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
        JobSearchByPositionView(helper: Helper(), width: .constant(CGFloat(340)), height: .constant(CGFloat(40)))
    }
}
