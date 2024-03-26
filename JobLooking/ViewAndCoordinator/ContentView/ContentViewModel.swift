//
//  ContentViewModel.swift
//  JobLooking
//
//  Created by Vladimir on 21.03.2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var ableOrDisable = true
    
    
    func changeTheViews() {
        ableOrDisable.toggle()
    }
}
