//
//  ContentView.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = JobsListViewModel()
    
    var body: some View {
        Text("Hello world")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
