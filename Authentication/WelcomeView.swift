//
//  WelcomeView.swift
//  Pumped
//
//  Created by Belier Javier on 3/12/24.
//

import SwiftUI
import Firebase

struct WelcomeView: View {
    @State var userIsLoggedIn: Bool = false
    @State var showReg: Bool = false
    @State var showLog: Bool = false
    @State var alpha = 0.0

    var body: some View {
        if userIsLoggedIn {
            Text("KABOOM")
        }
        else {
            content
        }
    }
    
    var content: some View {
        
        ZStack {
            Color("darkgray")
                .ignoresSafeArea()
            Circle()
                .scale(1.8)
                .foregroundColor(showReg ? .red : .white)
                .position(x: 100 , y: 0)
                .animation(.easeInOut(duration: 0.7), value: showReg)
            
            VStack {
                if showReg {
                    ZStack {
                        SignupView()
                            .opacity(alpha)
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 1.2).delay(0.5)) {
                                    alpha += 1.0
                                }
                            }
                    }
                        .zIndex(0)
                        .transition(.move(edge: .bottom))
                }
                else {
                    VStack {
                        IntroView()
                        
                        Button{
                            withAnimation(.easeInOut(duration: 1.2)) {
                                showReg.toggle()
                            }
                        }label: {
                            Text("Get Started")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.white)
                                .background(Color(.red))
                                .cornerRadius(15)
                        }
                        .shadow(color: Color("redglow"), radius: 10, x: 0, y: 5)
                        .padding([.horizontal], 45)
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Already have an account?")
                                .fontWeight(.regular)
                                .foregroundColor(Color.gray)
                            
                            Button{
                                withAnimation(.easeInOut(duration: 0.8)) {
                                    showLog.toggle()
                                }
                            } label: {
                                Text("Sign in")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            }
                        }.font(.system(size: 12))
                        
                    }.transition(.move(edge: .bottom))
                }
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
        
    }
}

struct IntroView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("welcome")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 360, height: 350, alignment: .center)
            
            Text("PUMPED")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding([.horizontal], 20)
            
            Text("Capture that pump and spread the motivation with friends.")
                .font(.title3)
                .multilineTextAlignment(.center)
                .fontWeight(.medium)
                .padding(.top, 10)
                .padding([.leading, .bottom, .trailing], 50)
            
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

struct RegButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(!isEnabled ? Color.gray : (configuration.isPressed ? Color.white : Color.red))
            .foregroundStyle(configuration.isPressed ? Color.black : Color.white)
            .cornerRadius(15)
            .shadow(color:!isEnabled ? .red.opacity(0.0) : Color("redglow").opacity(1.0), radius: 10, x: 0, y: 5)
            .animation(.easeInOut(duration: 0.2), value: isEnabled)
            
    }
}

#Preview {
    WelcomeView()
}
