//
//  ContentView.swift
//  Pumped
//
//  Created by Belier Javier on 3/10/24.
//

import SwiftUI

struct ContentView: View {
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
            
            RegisterButton(title: "Get Started")
            
            HStack {
                Text("Already have an account?")
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                Text("Sign in")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }.font(.system(size: 12))
            
        }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("darkgray"))
    }
}

struct RegisterButton: View {
    var title: String
    var body: some View {
        VStack {
            Text(title)
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
    }
}

#Preview {
    ContentView()
}

