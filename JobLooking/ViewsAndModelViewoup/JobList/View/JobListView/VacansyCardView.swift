//
//  VacansyCardView.swift
//  JobLooking
//
//  Created by Vladimir on 19.03.2024.
//

import SwiftUI

struct VacansyCardView: View {
    @ObservedObject var viewModel: JobsListViewModel
    let vacancy: Vacancy
    let helper: Helper
    
    private let width = UIScreen.main.bounds.width * 0.95
    private let height = UIScreen.main.bounds.height 
    
    @State private var show = true
    
    var body: some View {
        ZStack {
            SwiftUI.Button(action: {}) {
                Rectangle()
                    .frame(width: width , height: viewModel.rectangleHeight(vacancy, and: height))
                    .foregroundColor(helper.darkGray)
                    .cornerRadius(15)
            }
            HStack {
                VStack (alignment: .leading, spacing: 10) {
                    if viewModel.isSomeoneLokingAt(vacancy) {
                        Text(vacancy.lookingNumber?.people() ?? "")
                            .font(.system(size: 13))
                            .foregroundColor(.green)
                    }
                    
                    Text(vacancy.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: viewModel.hightOFTextField(with: vacancy, and: height))
                        .padding(.top, viewModel.isSomeoneLokingAt(vacancy) ? 0 : -30)
                    
                    Text(vacancy.salary.short ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, viewModel.isTheFeeSpecified(in: vacancy) ? 0 : -30)
                    Text(vacancy.address.town)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    HStack {
                        Text(vacancy.company)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        Image("VerifiedEmployer")
                            .resizable()
                            .frame(width: 10, height: 10)
                    }
                    HStack {
                        Image("Experience")
                            .resizable()
                            .frame(width: 10, height: 10)
                        Text(vacancy.experience.previewText)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
                    Text("Опубликовано \(vacancy.publishedDate.dateFormatter())")
                        .foregroundColor(helper.gray)
                    
                    SwiftUI.Button(action: {}) {
                        Text("Откликнуться")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: width * 0.9, height: height * 0.05)
                    .background(Color.green)
                    .cornerRadius(15)
                    .padding([.leading, .trailing], 5)
                    
                }
                .frame(width: width * 0.8, height: height * 0.8)
                .padding(.leading)
                
                SwiftUI.Button(action: {}) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
        }
        .padding(.bottom, 15)
    }
}

//struct VacansyCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        VacansyCardView(vacansy: <#Vacancy#>)
//    }
//}
