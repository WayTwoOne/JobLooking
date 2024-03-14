//
//  SwiftUIView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct PersonalAccountView: View {
    var body: some View {
        NavigationView {
            Text("He")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Text("Вход в личный кабинет")
                            .font(.title2).fontWeight(.bold)
                    })
                })
            }
        }
    }

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalAccountView()
    }
}
