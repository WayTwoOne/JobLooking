//
//  ButtonsView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct ButtonsView: View {
    let bluedisable = Color(#colorLiteral(red: 0, green: 0.3358300924, blue: 0.5637645721, alpha: 1))
    let blueAble = Color(#colorLiteral(red: 0.2073816359, green: 0.5835246444, blue: 0.9980860353, alpha: 1))
    let blueColor = Color(#colorLiteral(red: 0.2073816359, green: 0.5835246444, blue: 0.9980860353, alpha: 1))
    
    var body: some View {
        HStack(spacing: -10) {
            SwiftUI.Button(action: {
                print("hello")
            }, label: {
                Text("Продолжить")
                    .foregroundColor(.white)
            })
            .disabled(true)
            .frame(width: 167, height: 40)
            .background(bluedisable)
            .cornerRadius(10)
            .padding(.leading)
            SwiftUI.Button(action: {}) {
                Text("Войти с паролем")
                    .foregroundColor(blueColor)
            }
            .frame(width: 167, height: 40)
            .padding(.horizontal)
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
