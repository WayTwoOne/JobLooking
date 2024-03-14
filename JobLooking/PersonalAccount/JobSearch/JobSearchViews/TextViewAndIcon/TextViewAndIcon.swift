//
//  TextViewAndIcon.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct TextViewAndIcon: View {
    @Binding var textInput: String
    let gray = Color(#colorLiteral(red: 0.6852785945, green: 0.6852785945, blue: 0.6852785945, alpha: 1))
    let tryColor = Color(#colorLiteral(red: 0.2510857582, green: 0.2560860813, blue: 0.2651841938, alpha: 1))
    let xmarkColor = Color(#colorLiteral(red: 0.8861967921, green: 0.8861967921, blue: 0.8861967921, alpha: 1))
    let isHidden = false
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 340, height: 40)
                .foregroundColor(gray)
                .cornerRadius(10)
                .clipped()
                .shadow(color: Color.black, radius: 5, x: 0, y: 4)
            
            HStack(alignment: .center, spacing: -5) {
                Image("Envelope")
                    .resizable()
                    .frame(width: 24.2, height: 23.2)
                    .padding(.leading)
                    
                TextField("Электронная почта или телефон", text: $textInput)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .background(Color.black)
                    .frame(height: 30)
                    .padding()
                SwiftUI.Button(action: {}, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15.2, height: 15.2)
                        .foregroundColor(xmarkColor)
                        .padding(.trailing, 20)
                })
            }
            .padding(.horizontal)
        }
    }
}

struct TextViewAndIcon_Previews: PreviewProvider {
    static var previews: some View {
        TextViewAndIcon(textInput: .constant("Электронная почта или телефон"))
    }
}
