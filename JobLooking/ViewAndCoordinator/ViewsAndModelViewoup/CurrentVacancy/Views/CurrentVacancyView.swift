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
                        TitlePartView(viewModel: viewModel, job: job)
                        
                        MapCompanyView(viewModel: viewModel, helper: helper, job: job, width: width, height: height)
                        Text(job.description ?? "")
                        
                        Text("Ваши задачи")
                            .font(.title)
                        
                        Text(job.responsibilities )
                        
                        Text("Задайте вопрос работодателю")
                            .foregroundColor(.white)
                        
                        Text("Он получит его с откликом на вакансию")
                        
                        QuestionsPartView(viewModel: viewModel, job: job)
                        
                        SwiftUI.Button(action: {}) {
                            Text("Откликнуться")
                                .font(.system(size: 15))
                                .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.05, alignment: .center)
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                    }
                    
                }
            }
           
        }
        .environmentObject(lastViewModel)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                SwiftUI.Button {
                    viewModel.goBackToVacancyList(with: coordinator)
                } label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.green)
                }
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ForEach(0..<3) { image in
                    SwiftUI.Button(action: {}) {
                        Image(viewModel.imageNames[image])
                            .renderingMode()
                            .foregroundColor(.green)
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
