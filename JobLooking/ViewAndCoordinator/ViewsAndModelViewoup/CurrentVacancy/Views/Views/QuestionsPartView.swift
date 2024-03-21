//
//  QuestionsPartView.swift
//  JobLooking
//
//  Created by Vladimir on 21.03.2024.
//

import SwiftUI

struct QuestionsPartView: View {
    @ObservedObject var viewModel: CurrentVacancyViewModel
    let job: Vacancy
    
    var body: some View {
        ForEach(0..<job.questions.count) { question in
            SwiftUI.Button(action: {}) {
                Text(job.questions[question])
                    .frame(width: viewModel.quastionFiledsFrame(with: job.questions[question]), height: 10)
            }
            
        }
    }
}


