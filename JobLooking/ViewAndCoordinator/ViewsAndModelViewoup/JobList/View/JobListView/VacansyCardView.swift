//
//  VacansyCardView.swift
//  JobLooking
//
//  Created by Vladimir on 19.03.2024.
//

import SwiftUI
import Combine

struct VacansyCardView: View {
    @StateObject var viewModel: JobsListViewModel
    @EnvironmentObject var currentViewModel: CurrentVacancyViewModel
    @EnvironmentObject var coordinator: Coordinator
    @State private var toggle = false
    let vacancy: Vacancy
    let helper: Helper
    
    private let width = UIScreen.main.bounds.width * 0.95
    private let height = UIScreen.main.bounds.height
    
    var body: some View {
            ZStack {
                SwiftUI.Button(action: {
                    viewModel.appendToCurrent(vacancy: vacancy)
                    viewModel.pushToCurrentVacancy(coordinator: coordinator)
                }) {
                    Rectangle()
                        .frame(width: width , height: viewModel.rectangleHeight(vacancy, and: height))
                        .foregroundColor(helper.darkGray)
                        .cornerRadius(15)
                }
                HStack {
                    VStack (alignment: .leading, spacing: 10) {
                        if viewModel.isSomeoneLokingAt(vacancy) {
                            Text("Сейчас просматривает \(vacancy.lookingNumber?.people() ?? "")")
                                .font(.system(size: 13))
                                .foregroundColor(.green)
                        }
                        
                        Text(vacancy.title)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: viewModel.hightOFTextField(with: vacancy, and: height))
                            .padding(.top, viewModel.isSomeoneLokingAt(vacancy) ? 0 : 10)
                        
                        Text(vacancy.salary.short ?? "")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, viewModel.isTheFeeSpecified(in: vacancy) ? 0 : -30)
                        Text(vacancy.address.town)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        HStack {
                            Text(vacancy.company)
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            Image("VerifiedEmployer")
                                .resizable()
                                .frame(width: 15, height: 15)
                        }
                        HStack {
                            Image("Experience")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(vacancy.experience.previewText)
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                        }
                        Text("Опубликовано \(viewModel.dateFormatter(vacancy: vacancy))")
                            .foregroundColor(helper.gray)
                        
                        SwiftUI.Button(action: {}) {
                            Text("Откликнуться")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(width: width * 0.9, height: height * 0.05, alignment: .center)
                                .background(Color.green)
                                .cornerRadius(15)
                        }
                        
                        .padding([.leading, .trailing], 5)
                        
                    }
                    .padding(.leading, width * 0.1)
                    .frame(width: width * 0.8, height: height * 0.1)
                    
                    SwiftUI.Button(action: {
                        if viewModel.emptyFavoriteVacancysArray(vacancy: vacancy) {
                            viewModel.iLikeThisVacancy(vacancy: vacancy)
                            toggle.toggle()
                        } else if viewModel.doIHaveThisVacancy(vacancy: vacancy) {
                            viewModel.iDontLikeThisVacancy(vacancy: vacancy)
                            toggle.toggle()
                        } else {
                            viewModel.iLikeThisVacancy(vacancy: vacancy)
                            toggle.toggle()
                        }
                    }, label: {
                        if toggle {
                            Image(systemName: "suit.heart.fill")
                                .resizable().frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                        } else {
                            Image(systemName: "suit.heart")
                                .resizable().frame(width: 20, height: 20)
                                .foregroundColor(.red)
                        }
                    })
                    
                    
                    .padding(.bottom, viewModel.rectangleHeight(vacancy, and: height) * 0.77)
                    .padding(.leading)
                }
            }
        }
    }
