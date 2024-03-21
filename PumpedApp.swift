//
//  PumpedApp.swift
//  Pumped
//
//  Created by Belier Javier on 3/10/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    return true
  }
}

@main
struct PumpedApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authManager: AuthManager
    
    init() {
        FirebaseApp.configure()
        
        let authManager = AuthManager()
       _authManager = StateObject(wrappedValue: authManager)
        
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authManager)
        }
    }
}
