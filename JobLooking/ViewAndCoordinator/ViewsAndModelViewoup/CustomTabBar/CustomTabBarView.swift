//
//  CustomTabBar.swift
//  JobLooking
//
//  Created by Vladimir on 21.03.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    @StateObject var viewModel = CustomTabBarViewModel()
    @EnvironmentObject var jobListViewModel: JobsListViewModel
    
    @Binding var tabSelcted: Int
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<5) { index in
                    Spacer()
                    SwiftUI.Button {
                        tabSelcted = index + 1
                    } label: {
                        VStack {
                            Image(viewModel.tabBarItems[index].image)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(viewModel.tabBarItems[index].title)
                                .font(.system(size: 9))
                        }
                    }
                    
                    .foregroundColor(index + 1 == tabSelcted ? .blue : .white)
                        
                    Spacer()
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 50)
            .background(Color.black)
        }
        .environmentObject(jobListViewModel)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(viewModel: CustomTabBarViewModel(), tabSelcted: .constant(1))
    }
}
