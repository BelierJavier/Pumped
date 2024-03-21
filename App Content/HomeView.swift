//
//  HomeView.swift
//  Pumped
//
//  Created by Belier Javier on 3/21/24.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button {
            Logout()
        } label: {
            Text("Sign Out")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
       }.buttonStyle(RegButtonStyle())
        .padding(.bottom, 10)
        .padding(.horizontal, 45)
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
    HomeView()
}
