//
//  Navbar.swift
//  Pumped
//
//  Created by Belier Javier on 3/21/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case locationFill = "person.2"
    case dumbbell
    case person
}

struct Navbar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .foregroundColor(selectedTab == tab ? .red : .white)
                        .shadow(color:selectedTab == tab ? Color("redglow").opacity(1.0) : .red.opacity(0.0), radius: 8, x: 0, y: 5)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
                
            }
            .frame(width: nil, height: 60)
            .background(Color("darkgray"))
            .cornerRadius(10)
            .padding()
        }
    }
}

#Preview {
    Navbar(selectedTab: .constant(.house))
}
