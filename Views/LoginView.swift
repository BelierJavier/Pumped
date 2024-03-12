//
//  LoginView.swift
//  Pumped
//
//  Created by Belier Javier on 3/12/24.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var pass = ""

    
    var body: some View {
        ZStack() {
            Color("darkgray")
                .ignoresSafeArea()
            
            Circle()
                .scale(1.7)
                .foregroundColor(.black)
                .position(x: 100, y:-20)
            
            
            VStack() {
                
                HStack {
                    Text("GET BACK TO THE GRIND")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding([.horizontal, .bottom], 45)
                    Spacer()
                }
                
                TextField("Email", text: $email, prompt: Text("Email").foregroundStyle(Color(.gray)))
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(Color(.black))
                    .cornerRadius(15)
                    .padding([.horizontal], 45)
                    .padding(.bottom, 15)
                
                SecureField("Password", text: $pass, prompt: Text("Password").foregroundStyle(Color(.gray)))
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(Color(.black))
                    .cornerRadius(15)
                    .padding([.horizontal], 45)
                    .padding(.bottom, 30)
                
                
                VStack() {
                    
                    Button {
                        Login()
                    } label: {
                        Text("Sign Up")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .background(Color(.red))
                            .cornerRadius(15)
                    }
                    
                }
                .shadow(color: Color("redglow"), radius: 10, x: 0, y: 5)
                .padding([.horizontal], 45)
                .padding(.bottom, 10)
                
            }
            .foregroundColor(.white)
        }
    }
    func Login() {
        Auth.auth().signIn(withEmail: email, password: pass) {result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    LoginView()
}
