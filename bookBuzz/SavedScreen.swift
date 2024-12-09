//
//  SavedScreen.swift
//  bookBuzz
//
//  Created by Zuleyka Urieta on 12/7/24.
//

import SwiftUI

struct SavedScreen: View {
    @State private var selectedTab: Int = 2
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                // Profile Image
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 15) {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                }
            }
            .padding()
            
            // Title
            Text("Your Saved")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
                .padding(.bottom)
            
            // Saved Books Section
            VStack(alignment: .leading) {
                Text("Saved Books")
                    .font(.title3)
                    .foregroundColor(Color(red: 10/255, green: 140/255, blue: 200/255))
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(sampleBooks) { book in
                            BookCard(book: book)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            
            
            // Saved Profiles Section
            VStack(alignment: .leading) {
                Text("Saved Profiles")
                    .font(.title3)
                    .foregroundColor(Color(red: 10/255, green: 140/255, blue: 200/255))
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 15) {
            ForEach(["profile1", "profile2", "profile3", "profile4", "profile5"], id: \.self) { imageName in
                ProfileImage(imageName: imageName)
                
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer()
            
            // Bottom Navigation Bar
                       HStack {
                           ForEach(0..<4) { index in
                               if index == 0 {
                                   NavigationLink(destination: HomeScreen().navigationBarBackButtonHidden(true)) {
                                       // NavigationLink to HomeScreen
                                       Image(systemName: getTabIcon(index))
                                           .font(.system(size: 24))
                                           .foregroundColor(selectedTab == index ? .black : Color.white)
                                           .frame(maxWidth: .infinity)
                                   }
                               
                           } else if index == 3 {
                                   NavigationLink(destination: Profile_Screen().navigationBarBackButtonHidden(true)) {
                                       // NavigationLink to Profile_Screen
                                       Image(systemName: getTabIcon(index))
                                           .font(.system(size: 24))
                                           .foregroundColor(selectedTab == index ? .black : Color.white)
                                           .frame(maxWidth: .infinity)
                                   }
                               } else if index == 1 {
                                   NavigationLink(destination: ExploreScreen().navigationBarBackButtonHidden(true)) {
                                       // NavigationLink to Profile_Screen
                                       Image(systemName: getTabIcon(index))
                                           .font(.system(size: 24))
                                           .foregroundColor(selectedTab == index ? .black : Color.white)
                                           .frame(maxWidth: .infinity)
                                   }
                               } else {
                                   Button(action: {
                                       selectedTab = index
                                   }) {
                                       Image(systemName: getTabIcon(index))
                                           .font(.system(size: 24))
                                           .foregroundColor(selectedTab == index ? .black : Color.white)
                                           .frame(maxWidth: .infinity)
                                   }
                               }
                           }
                       }
                       .padding(.vertical, 8)
                       .background(
                           Capsule()
                               .fill(Color(red: 215/255, green: 50/255, blue: 100/255))
                               .frame(height: 60)
                       )
                       .padding(.horizontal)
                       .padding(.bottom, 20)
                   }
                   .navigationBarBackButtonHidden(true)
               }
        }

// Supporting Views/Models
struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let coverImage: String
    var rating: Int
}

struct BookCard: View {
    @State private var rating: Int
    let book: Book
    
    init(book: Book) {
        self.book = book
        _rating = State(initialValue: book.rating)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(book.coverImage)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 200)
                .cornerRadius(10)
            
            Text(book.title)
                .font(.headline)
            
            Text(book.author)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .foregroundColor(index <= rating ? .yellow : .gray)
                        .onTapGesture {
                            withAnimation {
                                rating = index
                            }
                        }
                }
            }
        }
        .frame(width: 150)
    }
}

struct ProfileImage: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 140, height: 160)
            .cornerRadius(15)
            .clipped()
    }
}

// My Sample Data
let sampleBooks = [
    Book(title: "Pride and Prejudice", author: "Jane Austen", coverImage: "pride_prejudice", rating: 5),
    Book(title: "Funny You Should Ask", author: "Elissa Sussman", coverImage: "funny_you_should_ask", rating: 4),
    Book(title: "Frankenstein", author: "Mary Shelly", coverImage: "frankenstein", rating: 4)
]

#Preview {
    SavedScreen()
}
