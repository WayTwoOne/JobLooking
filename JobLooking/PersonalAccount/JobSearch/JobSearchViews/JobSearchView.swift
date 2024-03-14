//
//  JobSearchView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct JobSearchView: View {
    @Binding var textinput: String
    let gray = Color(#colorLiteral(red: 0.6852785945, green: 0.6852785945, blue: 0.6852785945, alpha: 1))
    let bluedisable = Color(#colorLiteral(red: 0, green: 0.3358300924, blue: 0.5637645721, alpha: 1))
    let blueAble = Color(#colorLiteral(red: 0.2073816359, green: 0.5835246444, blue: 0.9980860353, alpha: 1))
    let blueColor = Color(#colorLiteral(red: 0.2073816359, green: 0.5835246444, blue: 0.9980860353, alpha: 1))
    let mainRectangleColor = Color(#colorLiteral(red: 0.1776687205, green: 0.1831440926, blue: 0.1930666268, alpha: 1))
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 370, height: 200)
                .foregroundColor(mainRectangleColor)
                .cornerRadius(15)
            VStack(alignment: .leading, spacing: 20) {
                Text("Поиск работы")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(alignment: .leading)
                    .padding(.horizontal, 32)
                TextViewAndIcon(textInput: $textinput)
                ButtonsView()
                .padding(.horizontal)
            }
        }
    }
}

struct JobSearchView_Previews: PreviewProvider {
    static var previews: some View {
        JobSearchView(textinput: .constant("Электронная почта или телефон"))
    }
}
