//
//  OpeningScreen.swift
//  bookBuzz
//
//  Created by Zuleyka Urieta on 12/7/24.
//

import SwiftUI

struct OpeningScreen: View {
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(spacing: 20) {
                Text("bookBuzz")
                    .font(.system(size: 45))
                    .bold()
                    .foregroundColor(Color(red: 10/255, green: 140/255, blue: 200/255))
                    .padding(.top, 50)
                
                ZStack {
                    Image("reading_illustration")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.horizontal)
                    
                    Button("Get Started") {
                        navigationPath.append("explore")
                    }
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        Capsule()
                            .fill(Color.white)
                            .stroke(Color(red: 10/255, green: 140/255, blue: 200/255), lineWidth: 5)
                    )
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                }
            }
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "explore":
                    ExploreScreen()
                        .navigationBarBackButtonHidden(true)
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        OpeningScreen()
    }
}
