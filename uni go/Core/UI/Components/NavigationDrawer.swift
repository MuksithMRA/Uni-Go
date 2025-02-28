//
//  NavigationDrawer.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct NavigationDrawer: View {
    @Binding var isOpen: Bool
    @Binding var selectedTab: String
    let currentUserName: String
    let currentUserID: String
    let currentUserEmail: String
    let profileImageName: String
    
    var body: some View {
        ZStack {
            if isOpen {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isOpen = false
                        }
                    }
            }
            
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    VStack(alignment: .center, spacing: 10) {
                        HStack {
                            Spacer()
                            
                            HStack(spacing: 5) {
                                Image(systemName: "globe")
                                    .font(.system(size: 14))
                                Text("EN")
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding(.trailing, 16)
                            .padding(.top, 16)
                        }
                        
                        Image(profileImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 3))
                        
                        Text(currentUserName)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(currentUserID)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                        
                        Text(currentUserEmail)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                            .padding(.bottom, 20)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .background(Color.blue)
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            Button(action: {
                                selectedTab = "Home"
                                withAnimation {
                                    isOpen = false
                                }
                            }) {
                                DrawerMenuItemView(icon: "house.fill", title: "Home", isSelected: selectedTab == "Home")
                            }
                            
                            Button(action: {
                                selectedTab = "Places"
                                withAnimation {
                                    isOpen = false
                                }
                            }) {
                                DrawerMenuItemView(icon: "mappin.and.ellipse", title: "Places", isSelected: selectedTab == "Places")
                            }
                            
                            Button(action: {
                                selectedTab = "RewardStore"
                                withAnimation {
                                    isOpen = false
                                }
                            }) {
                                DrawerMenuItemView(icon: "gift", title: "Reward Store", isSelected: selectedTab == "RewardStore")
                            }
                            
                            Button(action: {
                                selectedTab = "Profile"
                                withAnimation {
                                    isOpen = false
                                }
                            }) {
                                DrawerMenuItemView(icon: "person.circle", title: "Profile", isSelected: selectedTab == "Profile")
                            }
                            
                            Button(action: {
                                selectedTab = "Settings"
                                withAnimation {
                                    isOpen = false
                                }
                            }) {
                                DrawerMenuItemView(icon: "gearshape", title: "Settings", isSelected: selectedTab == "Settings")
                            }
                            
                            Button(action: {
                                selectedTab = "Feedback"
                                withAnimation {
                                    isOpen = false
                                }
                            }) {
                                DrawerMenuItemView(icon: "hand.thumbsup", title: "Feedback", isSelected: selectedTab == "Feedback")
                            }
                            
                            Button(action: {
                                selectedTab = "FAQ"
                                withAnimation {
                                    isOpen = false
                                }
                            }) {
                                DrawerMenuItemView(icon: "info.circle", title: "FAQ", isSelected: selectedTab == "FAQ")
                            }
                            
                            Spacer()
                                .frame(height: 60)
                            
                            // Logout button at the bottom
                            Button(action: {
                                // Logout action
                            }) {
                                DrawerMenuItemView(icon: "rectangle.portrait.and.arrow.right", title: "Logout", isSelected: false)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.8)
                .background(Color.white)
                .offset(x: isOpen ? 0 : -UIScreen.main.bounds.width * 0.8)
                .animation(.easeInOut(duration: 0.3), value: isOpen)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

// Individual menu item view
struct DrawerMenuItemView: View {
    let icon: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(isSelected ? .blue : .black)
                .frame(width: 24)
            
            Text(title)
                .font(.system(size: 16, weight: isSelected ? .semibold : .regular))
                .foregroundColor(isSelected ? .blue : .black)
            
            Spacer()
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .background(isSelected ? Color.blue.opacity(0.1) : Color.white)
        .cornerRadius(4)
    }
}

// Preview
struct NavigationDrawerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDrawer(
            isOpen: .constant(true),
            selectedTab: .constant("Profile"),
            currentUserName: "Rakshath Maurya",
            currentUserID: "YR3COBBSC#####",
            currentUserEmail: "rakshath@student.nibm.lk",
            profileImageName: "profile_image"
        )
    }
}
