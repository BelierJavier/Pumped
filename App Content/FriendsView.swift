//
//  FriendsView.swift
//  Pumped
//
//  Created by Belier Javier on 3/21/24.
//

import SwiftUI

struct FriendsView: View {
    @State private var username = ""
    var body: some View {
        ZStack {
            Color("spacegray")
                .ignoresSafeArea()
            VStack {
                TextField("Search", text: $username, prompt: Text("Find new friends").foregroundStyle(Color(.gray)))
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(Color(.black))
                    .cornerRadius(15)
                    .padding([.horizontal], 45)
                    .padding(.bottom, 15)
                Text("Friends")
                    .bold()
                    .foregroundStyle(Color(.white))
                
            }
        }
    }
}

#Preview {
    FriendsView()
}
