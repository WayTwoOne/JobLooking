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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Group {
                Text(job.title)
                    .font(.title)
                Text(job.salary.full)
                Text(job.experience.text)
                Text(viewModel.typeOfEmployment(with: job.schedules))
            }
            
            HStack {
                HStack {
                    Text("\(job.appliedNumber ?? 0) уже откликнулись")
                    Text("\((job.lookingNumber ?? 0).people()) cейчас смотрят")
                }
            }
        }
        
    }
}
