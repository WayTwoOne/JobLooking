//
//  EnteringTheReceivedCodeView.swift
//  JobLooking
//
//  Created by Vladimir on 16.03.2024.
//

import SwiftUI

struct PinCodeTextFieldView: View {
    @ObservedObject var viewModel: EnteringTheReceivedCodeViewModel
    let helper: Helper
    @FocusState private var hasFocus: Int?
    
    
    var body: some View {
        HStack {
            ForEach(0..<viewModel.numberOfFields, id: \.self) { index in
                TextField("*", text: $viewModel.pinCode[index])
                    .keyboardType(.numberPad)
                    .frame(width: 48, height: 48)
                    .background(helper.gray.opacity(0.8))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($hasFocus, equals: index)
                    .tag(index)
                
                    .sync($viewModel.hasFocus, with: _hasFocus)
                
                    .onChange(of: viewModel.pinCode[index]) { newValue in
                        
                        viewModel.onlyNumbers(index: index, newValue: newValue)
                        
                        viewModel.onlyOneDigitInTheField(index: index)
                        
                        viewModel.stepLeftStepRightAcrossTheFields(newValue: newValue, index: index)
                        
                        viewModel.ableButton()
                    }
            }
        }
    }
}
    

