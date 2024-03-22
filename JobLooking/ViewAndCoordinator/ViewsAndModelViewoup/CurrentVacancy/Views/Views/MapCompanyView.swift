//
//  MapCompanyView.swift
//  JobLooking
//
//  Created by Vladimir on 21.03.2024.
//

import SwiftUI

struct MapCompanyView: View {
    @ObservedObject var viewModel: CurrentVacancyViewModel
    let helper: Helper
    let job: Vacancy
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(helper.gray)
                .frame(width: width * 0.92, height: height * 0.17)
                .cornerRadius(15)
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(job.company)
                        .foregroundColor(.white)
                    Image("VerifiedEmployer")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                Image("mapExapmle")
                    .resizable()
                    .frame(width: width * 0.8, height: height * 0.08)
                Text(viewModel.fullAdress(from: job))
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
}
