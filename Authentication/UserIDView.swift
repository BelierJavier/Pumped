//
//  UserIDView.swift
//  Pumped
//
//  Created by Belier Javier on 4/2/24.
//

import SwiftUI

struct UserIDView: View {
    
    @State private var username = ""
    @State private var name = ""
    @State private var profileImage: Image?
    var body: some View {
        ZStack {
            Color("spacegray")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("EDIT YOUR PROFILE")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding([.horizontal, .bottom], 45)
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.top, 40)
                Spacer()
            }
            
            
            VStack {
                Image(systemName: "figure.strengthtraining.traditional")
                    .resizable()
                    .padding()
                    .foregroundColor(.white)
                    .background(.gray)
                    .frame(width: 150, height: 150)
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding()
                    .padding(.bottom, 30)
                
                HStack {
                    Image(systemName: "person")
                    TextField("Search", text: $username, prompt: Text("Username").foregroundStyle(Color(.gray)))
                        
                }.font(.subheadline)
                .fontWeight(.regular)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(Color(.black))
                .cornerRadius(15)
                .padding([.horizontal], 45)
                .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "pencil.line")
                    TextField("Search", text: $name, prompt: Text("Display name").foregroundStyle(Color(.gray)))
                        
                }.font(.subheadline)
                .fontWeight(.regular)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(Color(.black))
                .cornerRadius(15)
                .padding([.horizontal], 45)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                                print("Round Action")
                                }) {
                                Image(systemName: "arrow.right")
                                    .frame(width: 50, height: 50)
                            }.disabled((username.isEmpty))
                            .buttonStyle(RegButtonStyle())
                            .padding(.bottom, 10)
                }.padding([.horizontal], 45)
            }
        }
    }
}

#Preview {
    UserIDView()
}
