//
//  ContentView.swift
//  DesignCodeiOS15App
//
//  Created by SandsLee on 2022/6/5.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    AccountView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
            
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 13 Pro")
                .previewInterfaceOrientation(.portrait)
        }
    }
}
