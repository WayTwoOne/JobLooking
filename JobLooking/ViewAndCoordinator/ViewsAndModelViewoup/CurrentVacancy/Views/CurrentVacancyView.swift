//
//  CurrentVacancyView.swift
//  JobLooking
//
//  Created by Vladimir on 20.03.2024.
//

import SwiftUI

struct CurrentVacancyView: View {
    @StateObject var viewModel = CurrentVacancyViewModel()
    @EnvironmentObject var lastViewModel: JobsListViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    
    let helper: Helper
    
    let width = UIScreen.main.bounds.width * 0.95
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(lastViewModel.currentVacancy, id: \.id) { job in
                    VStack(alignment: .leading, spacing: 10) {
                        TitlePartView(viewModel: viewModel, job: job, helper: helper)
                        
                        MapCompanyView(viewModel: viewModel, helper: helper, job: job)
                        VStack(alignment: .leading, spacing: 15) {
                            Text(job.description ?? "")
                                .foregroundColor(.white)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Ваши задачи")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Text(job.responsibilities )
                                    .foregroundColor(.white)
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Задайте вопрос работодателю")
                                    .foregroundColor(.white)
                                Text("Он получит его с откликом на вакансию")
                                    .foregroundColor(helper.gray)
                            }
                            .padding(.bottom)
                            
                            QuestionsPartView(viewModel: viewModel, job: job, helper: helper)
                        }
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        
                        SwiftUI.Button(action: {}) {
                            Text("Откликнуться")
                                .font(.system(size: 15))
                                .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.05, alignment: .center)
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    
                }
            }
            .background(Color.black)
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                SwiftUI.Button {
                    viewModel.goBackToVacancyList(with: coordinator)
                    lastViewModel.removeCurrentVacancy()
                } label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.green)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    ForEach(0..<3) { image in
                    SwiftUI.Button(action: {}) {
                        Image(viewModel.imageNames[image])
                            .renderingMode(.template)
                            .foregroundColor(.green)
                    }
                    }
                }
            }
            
        }
        
    }
}

//struct CurrentVacancyView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentVacancyView(viewModel: viewModel, vacancy: vacancy)
//    }
//}
