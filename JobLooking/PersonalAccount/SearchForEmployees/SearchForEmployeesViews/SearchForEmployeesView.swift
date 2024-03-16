//
//  SearchForEmployeesView.swift
//  JobLooking
//
//  Created by Vladimir on 15.03.2024.
//

import SwiftUI

struct SearchForEmployeesView: View {
    
    @State private var mainWidth = UIScreen.main.bounds.width * 0.95
    @State private var mainHeight = UIScreen.main.bounds.height * 0.2
    
    private var helper = Helper()
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: mainWidth, height: mainHeight * 0.9)
                .foregroundColor(helper.mainRectangleColor)
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Поиск работы")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: mainWidth * 0.9, alignment: .leading)
                    
                
                Text("Размещение вакансий и доступ к базе резюме")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .frame(alignment: .leading)
                    
                    
                
                SwiftUI.Button(action: {}) {
                    Text("Я ищу сотрудников")
                        .foregroundColor(.white)
                }
                
                .frame(width: mainWidth * 0.83, height: mainHeight * 0.2)
                .padding(.horizontal)
                .background(Color.green)
                .cornerRadius(15)
                
            }
        }
    }
}

struct SearchForEmployeesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchForEmployeesView()
    }
}
