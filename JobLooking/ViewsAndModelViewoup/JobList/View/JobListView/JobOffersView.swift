//
//  JobListViewCell.swift
//  JobLooking
//
//  Created by Vladimir on 18.03.2024.
//

import SwiftUI

struct JobOffersView: View {
    @ObservedObject var viewModel: JobsListViewModel
    let helper: Helper
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack {
                ForEach(viewModel.jobOffers, id: \.title) { job in
                    SwiftUI.Button(action: {}) {
                        HStack {
                            ZStack {
                                Rectangle()
                                VStack(alignment: .leading, spacing: 10) {
                                    Image(job.id ?? "")
                                        .resizable()
                                        .frame(width: width / 13, height: height / 29)
                                        .padding(.top, 15)
                                        .padding(.leading, 10)
                                        .padding(.bottom, -10)
                                    
                                    Text("\(viewModel.withoutUnnecessarySpaces(with: job.title))")
                                        .foregroundColor(.white)
                                        .frame(width: width / 3.3 ,height: height / 15)
                                        .font(.system(size: 13))
                                        .multilineTextAlignment(.leading)
                                        .padding(.horizontal, 10)
                                        
                                    SwiftUI.Button(action: {}) {
                                        Text(job.button?.text ?? "")
                                            .foregroundColor(.green)
                                            .font(.system(size: 12))
                                            .padding([.leading, .bottom], 15)
                                    }
                                        
                                    
                                }
//                                .padding(.horizontal, 5)
                            }
                        }
                    }
                    .foregroundColor(helper.darkGray)
                    .frame(width: width / 3, height: height / 7)
                    .cornerRadius(15)
                }
            }
        }
        .frame(height: height / 5.5)
        .padding(.leading, 10)
    }
}

struct JobListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        JobOffersView(viewModel: JobsListViewModel(), helper: Helper())
    }
}
