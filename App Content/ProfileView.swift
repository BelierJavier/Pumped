//
//  ProfileView.swift
//  Pumped
//
//  Created by Belier Javier on 3/21/24.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        
        ZStack {
            
            VStack {
                Button {
                    Logout()
                } label: {
                    Text("Sign Out")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
               }
                .buttonStyle(RegButtonStyle())
                .padding(.horizontal, 45)
            }
        }
    }
    func Logout(){
        do {
          try Auth.auth().signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

#Preview {
    ProfileView()
}
