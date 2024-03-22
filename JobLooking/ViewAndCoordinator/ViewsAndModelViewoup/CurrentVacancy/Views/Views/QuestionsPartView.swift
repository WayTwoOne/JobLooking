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
    let helper: Helper
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(0..<job.questions.count) { index in
                    SwiftUI.Button(action: {}) {
                        Text(job.questions[index])
                            .frame(width: viewModel.widthOf(question: job.questions[index], and: width) , height: 10)
                            .foregroundColor(.white)
                            .background {
                                Rectangle()
                                    .frame(width: viewModel.widthOf(question: job.questions[index], and: width) , height: 30)
                                    .foregroundColor(helper.gray)
                                    .cornerRadius(15)
                            }
                        
                    }
                    .disabled(true)
                }
            }
        }
    }


