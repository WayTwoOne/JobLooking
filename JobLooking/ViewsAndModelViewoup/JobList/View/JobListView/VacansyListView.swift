//
//  VacansyCardView.swift
//  JobLooking
//
//  Created by Vladimir on 19.03.2024.
//

import SwiftUI

struct VacansyListView: View {
    @ObservedObject var viewModel: JobsListViewModel
    let helper: Helper
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(viewModel.firstThreeElementsArray, id: \.title) { vacancy in
                    VacansyCardView(viewModel: viewModel, vacancy: vacancy, helper: helper)
                }
            }
        .background {
            Color.black
                .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)
                .ignoresSafeArea()
        }
        .onAppear {
            Task {
                await viewModel.fetchDataPressed()
            }
            
        }
    }
}

struct VacansyCardView_Previews: PreviewProvider {
    static var previews: some View {
        VacansyListView(viewModel: JobsListViewModel(), helper: Helper())
    }
}
