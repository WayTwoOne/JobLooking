//
//  PeopleLookingFields.swift
//  JobLooking
//
//  Created by Vladimir on 22.03.2024.
//

import SwiftUI

struct PeopleLookingFields: View {
    @ObservedObject var viewModel: CurrentVacancyViewModel
    let job: Vacancy
    let helper: Helper
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    var body: some View {
        HStack {
            HStack {
                Text("\((job.appliedNumber ?? 0).people()) уже откликнулись")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .padding(.leading, -35)
                    .padding(.horizontal, 35)
                ZStack {
                    Circle()
                        .foregroundColor(.green)
                    Image("profile")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 10, height: 10)
                        .foregroundColor(.white)
                    
                }
                .padding(.top, -10)
                .frame(width: 16, height: 16)
                
            }
            .frame(width: viewModel.responceFrame(looking: job.lookingNumber, responce: job.appliedNumber, width: width) , height: height * 0.05)
            .background(helper.darkGreen)
            .cornerRadius(5)
            HStack {
                Text("\((job.lookingNumber ?? 0).people()) cейчас смотрят")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .padding(.leading, -35)
                    .padding(.horizontal, 35)
                   
                ZStack {
                    Circle()
                        .foregroundColor(.green)
                    Image("eye")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 15, height: 10)
                        .foregroundColor(.white)
                }
                .padding(.top, -10)
                .frame(width: 16, height: 16)
                
            }
            .frame(width: viewModel.lookingFrame(looking: job.lookingNumber, responce: job.appliedNumber, width: width), height: height * 0.05)
            .background(helper.darkGreen)
            .cornerRadius(5)
        }
    }
}
