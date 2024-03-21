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
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(helper.gray)
                .frame(width: width, height: height * 0.2)
            VStack {
                HStack {
                    Text(job.company)
                    Image("VerifiedEmployer")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Image("mapExapmle")
                Text(viewModel.fullAdress(from: job))
            }
        }
    }
}
