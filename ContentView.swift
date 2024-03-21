//
//  ContentView.swift
//  Pumped
//
//  Created by Belier Javier on 3/10/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        WelcomeView()
    }
}

#Preview {
    ContentView()
}

