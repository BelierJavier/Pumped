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
    @State var showLog: Bool = false
    
    var body: some View {
       
        ZStack {
            VStack() {
                
                HStack {
                    Text("CREATE AN ACCOUNT")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding([.horizontal, .bottom], 45)
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "envelope")
                    TextField("Email", text: $email, prompt: Text("Email").foregroundStyle(Color(.gray)))
                }.font(.subheadline)
                .fontWeight(.regular)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(Color(.black))
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.red, lineWidth: !email.isEmpty && !isEmail() ? 3 : 0))
                .padding([.horizontal], 45)
                .padding(.bottom, 15)
                
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text: $pass, prompt: Text("Password").foregroundStyle(Color(.gray)))
                }.font(.subheadline)
                .fontWeight(.regular)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(Color(.black))
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.yellow, lineWidth: !securePass() && !pass.isEmpty ? 3 : 0))
                .padding([.horizontal], 45)
                .padding(.bottom, 15)
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("Re-Password", text: $repass, prompt: Text("Confirm password").foregroundStyle(Color(.gray)))
                }.font(.subheadline)
                .fontWeight(.regular)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(Color(.black))
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.red, lineWidth: !passConfirm() && !repass.isEmpty ? 3 : 0))
                .padding([.horizontal], 45)
                .padding(.bottom, 30)
                
                VStack() {
                    
                    Button {
                        Register()
                    } label: {
                        Text("Sign Up")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .disabled((email.isEmpty || pass.isEmpty || repass.isEmpty) || (!isEmail()) || (!passConfirm()) || (!securePass()))
                    .buttonStyle(RegButtonStyle())
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("Already have an account?")
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                        
                        Button{
                            withAnimation(.easeInOut(duration: 1.2)) {
                                showLog.toggle()
                            }
                        } label: {
                            Text("Sign in")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                    }.font(.system(size: 12))
                    
                }
                .padding([.horizontal], 45)
                .padding(.bottom, 10)
                
                
        
            }
            .foregroundColor(.white)
        }.zIndex(0)
        
        if showLog {
            
            ZStack {
                VStack {
                    Button {
                        withAnimation(.easeInOut(duration: 0.8)) {
                            showLog.toggle()
                        }
                    } label: {
                        Text("")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .labelsHidden()
                    .background(Color(.black))
                    .opacity(0.8)
                    .frame(height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                }
            }
            .zIndex(1)
        }
        if showLog {
            ZStack {
                LoginView()
            }
            .zIndex(2)
            .transition(.move(edge: .bottom))
        }
        
    }
    
    func Register() {
        if (!email.isEmpty || !pass.isEmpty || !repass.isEmpty) {
            if ((passConfirm()) && isEmail()) {
                Auth.auth().createUser(withEmail: email, password: pass) {result, error in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                }
            }
            else {
                
            }
        }
    }
    
    func isEmail() -> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func securePass() -> Bool{
        let passRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        return pass.range(of: passRegex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func passConfirm() -> Bool{
        return pass == repass
    }
}

#Preview {
    SignupView()
}

