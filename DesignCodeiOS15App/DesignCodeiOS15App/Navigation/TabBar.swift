//
//  TabBar.swift
//  DesignCodeiOS15App
//
//  Created by SandsLee on 2022/8/1.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var selectedColor: Color = .teal
    @State var tabItemWidth: CGFloat = 0
    var body: some View {
        HStack {
            buttons
        }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
        .strokeStyle(cornerRadius: 34)
        .background(
            background
        )
        .overlay(
            overlay
        )
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    var buttons: some View {
        ForEach(tabItems) { item in
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTab = item.tab
                    selectedColor = item.color
                }
            }, label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            })
            .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
            .overlay {
                GeometryReader { proxy in
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            }
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    
    var background: some View {
        HStack {
            if selectedTab == .library { Spacer() }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            if selectedTab == .explore { Spacer() }
            Circle().fill(selectedColor).frame(width: tabItemWidth)
            if selectedTab == .home { Spacer() }
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if selectedTab == .notifications { Spacer() }
        }
        .padding(.horizontal, 8)
    }
    
    var overlay: some View {
        HStack {
            if selectedTab == .library { Spacer() }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            if selectedTab == .explore { Spacer() }
            Rectangle()
                .fill(selectedColor)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
                
            if selectedTab == .home { Spacer() }
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if selectedTab == .notifications { Spacer() }
        }
        .padding(.horizontal, 8)
    }
    
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewInterfaceOrientation(.portrait)
    }
}
