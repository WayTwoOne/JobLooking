//
//  TitlePartView.swift
//  JobLooking
//
//  Created by Vladimir on 21.03.2024.
//

import SwiftUI

struct TitlePartView: View {
    @ObservedObject var viewModel: CurrentVacancyViewModel
    let job: Vacancy
    let helper: Helper
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Group {
                Text(job.title)
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top)
                Text(job.salary.full)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                Text("Требуемый опыт: \(job.experience.text)")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                Text(viewModel.typeOfEmployment(with: job.schedules))
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .padding(.top, -10)
            }
            
            PeopleLookingFields(viewModel: viewModel, job: job, helper: helper)
            }
        .padding(.leading)
            
        }
        
    }
