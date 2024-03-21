//
//  ContentViewModel.swift
//  JobLooking
//
//  Created by Vladimir on 21.03.2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var ableOrDisable = false
    
    func changeTheViews() {
        ableOrDisable.toggle()
    }
}
