//
//  AccountView.swift
//  DesignCodeiOS15App
//
//  Created by SandsLee on 2022/7/28.
//

import SwiftUI

struct AccountView: View {
    @State private var isDeleted = false
    @State private var isPined = false
    
    var body: some View {
        NavigationView {
            List {
                profile
                
                menu
                
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text("Meng To")
                .font(.title)
                .fontWeight(.semibold)
            HStack {
                Image(systemName: "location")
                    .imageScale(.medium)
                Text("China")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink {
                HomeView()
            } label: {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {
                Text("Billing")
            } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink {
                Text("Help")
            } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://apple.com/")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .imageScale(.small)
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        isDeleted = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    
                    pinButton
                }
            }
            Link(destination: URL(string: "https://youtube.com/")!) {
                HStack {
                    Label("YouTube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .imageScale(.small)
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton: some View {
        Button {
            isPined.toggle()
        } label: {
            if isPined {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(isPined ? .gray : .yellow)
    }
    
    
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
