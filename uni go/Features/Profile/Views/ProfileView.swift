//
//  ProfileView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-03-01.
//

import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = "Rakshath"
    @State private var lastName: String = "Maurya"
    @State private var email: String = "rakshath@student.nibm.lk"
    @State private var studentID: String = "YR3COBBSC#####"
    @State private var password: String = "••••••••••••"
    var nextEvent: Event
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    CustomHeader.full(
                        title: "Profile",
                        pointsValue: 50,
                        notificationCount: 2,
                        onBackTapped: {
                            print("Back button tapped")
                        },
                        onNotificationTapped: {
                            print("Notification button tapped")
                        },
                        onMenuTapped: {
                            print("Menu button tapped")
                        }
                    )
                    
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 90, height: 90)
                            
                            Image("profile_image")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                        }
                        
                        Text("Rakshath Maurya")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text(studentID)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text(email)
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    .padding(.vertical, 10)
                    
                    Text("Next Event")
                        .font(.poppins(fontStyle: .body, fontWeight: .semibold))
                        .padding(.horizontal)
                    
                    NextEventCardView(event: nextEvent)
                        .padding(.horizontal)
                    
                    VStack(spacing: 0) {
                        ProfileFieldView(title: "First Name", value: firstName)
                        Divider().padding(.leading, 20)
                        ProfileFieldView(title: "Last Name", value: lastName)
                        Divider().padding(.leading, 20)
                        ProfileFieldView(title: "Email", value: email)
                        Divider().padding(.leading, 20)
                        ProfileFieldView(title: "Student / Lecturer ID", value: studentID)
                        Divider().padding(.leading, 20)
                        ProfileFieldView(title: "Password", value: password)
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                }
                .background(Color.gray.opacity(0.05))
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProfileFieldView: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.poppins(fontStyle: .footnote, fontWeight: .medium))
                    .foregroundColor(.gray)
                
                Text(value)
                    .font(.poppins(fontStyle: .caption, fontWeight: .medium))
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image(systemName: "pencil")
                    .foregroundColor(.blue)
            }
            .padding(.trailing, 20)
        }
    }
}

#Preview {
    ProfileView(nextEvent: Event(
        title: "IOS Lectures",
        location: "Harrison Hall",
        startTime: "13:30",
        remainingMinutes: 30,
        date: "01/02/2025",
        image: "lecHall_image"
    ))
}
