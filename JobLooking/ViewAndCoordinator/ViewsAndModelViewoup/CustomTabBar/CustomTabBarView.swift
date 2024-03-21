//
//  CustomTabBar.swift
//  JobLooking
//
//  Created by Vladimir on 21.03.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    @StateObject var viewModel = CustomTabBarViewModel()
    
    var body: some View {
        VStack {
            HStack {
                ForEach(viewModel.allCases, id: \.rawValue) { tab in
                    Spacer()
                    VStack {
                        Image(tab.rawValue)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(viewModel.tapped == tab ? .blue : .white)
                        Text(viewModel.textUnderImage(with: tab))
                            .foregroundColor(viewModel.tapped == tab ? .blue : .white)
                            .font(.system(size: 9))
                    }
                    .onTapGesture {
                        viewModel.tapped = tab
                    }
                    Spacer()
                }
                
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .background(Color.black)
            }
        }
    }
}

//struct CustomTabBar_Previews: PreviewProvider {
//    @State var tab = Tab.magnifier
//    static var previews: some View {
//        CustomTabBarView(selectedTab: .constant(.messages))
//    }
//}
