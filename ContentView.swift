//
//  ContentView.swift
//  Pumped
//
//  Created by Belier Javier on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var selectedTab: Tab = .house
    
    var body: some View {
        if authManager.authState != .signedIn {
            WelcomeView()
        } else {
            ZStack {
                Color("spacegray")
                    .ignoresSafeArea()
                
                VStack {
                    if selectedTab == .house {
                        HomeView()
                    }
                    if selectedTab == .locationFill {
                        FriendsView()
                    }
                    if selectedTab == .dumbbell {
                        SummaryView()
                    }
                    if selectedTab == .person {
                        ProfileView()
                    }
                }
                
                VStack {
                    Spacer()
                    Navbar(selectedTab: $selectedTab)
                }
            }.onAppear() {
                selectedTab = .house
            }
        }
    }
}

#Preview {
    ContentView()
}

