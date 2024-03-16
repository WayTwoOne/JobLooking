//
//  EnteringTheReceivedCodeView.swift
//  JobLooking
//
//  Created by Vladimir on 16.03.2024.
//

import SwiftUI

struct PinCodeTextFieldView: View {
    private var helper = Helper()
    
    @ObservedObject private var viewModel = EnteringTheReceivedCodeViewModel(numberOfFields: 4)
    
    @FocusState private var hasFocus: Int?
    
    
    var body: some View {
        HStack {
            ForEach(0..<viewModel.numberOfFields, id: \.self) { index in
                TextField("*", text: $viewModel.pinCode[index])
                    .keyboardType(.numberPad)
                    .frame(width: 48, height: 48)
                    .background(helper.darkGray.opacity(0.1))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($hasFocus, equals: index)
                    .tag(index)
                
                    .onChange(of: viewModel.pinCode[index]) { newValue in
                        viewModel.onlyNumbers(index: index, newValue: newValue)
                        if viewModel.pinCode[index].count > 1 {
                            viewModel.pinCode[index] = String(viewModel.pinCode[index].suffix(1))
                        }
                        
                        if Int(viewModel.pinCode[index]) == nil {
                            hasFocus = nil
                        }
                        
                        if !newValue.isEmpty {
        
                            if index == viewModel.numberOfFields - 1 {
                                hasFocus = nil
                            } else {
                                hasFocus = (hasFocus ?? 0) + 1
                            }
                            
                        } else {
                            hasFocus = (hasFocus ?? 0) - 1
                        }
                    }
                }
            }
        }
    }
    
struct EnteringTheReceivedCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PinCodeTextFieldView()
    }
}