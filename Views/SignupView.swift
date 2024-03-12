//
//  SignupView.swift
//  Pumped
//
//  Created by Belier Javier on 3/11/24.
//

import SwiftUI
import Firebase

struct SignupView: View {
    @State private var email = ""
    @State private var pass = ""
    @State private var repass = ""

    
    var body: some View {
        NavigationView {
            ZStack() {
                Color("darkgray")
                    .ignoresSafeArea()
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.red)
                    .position(x: 100, y:0)
                
                
                VStack() {
                    
                    HStack {
                        Text("CREATE AN ACCOUNT")
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
                        .padding(.bottom, 15)
                    
                    SecureField("Re-Password", text: $repass, prompt: Text("Confirm password").foregroundStyle(Color(.gray)))
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
                            Register()
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
    }
    
    func Register() {
        Auth.auth().createUser(withEmail: email, password: pass) {result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    SignupView()
}

