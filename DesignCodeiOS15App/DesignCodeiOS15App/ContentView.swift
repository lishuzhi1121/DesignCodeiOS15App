//
//  ContentView.swift
//  DesignCodeiOS15App
//
//  Created by SandsLee on 2022/6/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(13.0)
            Text("SwiftUI for iOS 15")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                .font(.footnote)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20.0)
        .frame(height: 350.0)
        .background(Color("BackgroundColor"))
        .cornerRadius(30.0)
        .shadow(color: Color("ShadowColor").opacity(0.3), radius: 10, x: 0, y: 10)
        .padding(.horizontal, 20)
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
