//
//  MainDashboardView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct MainDashboardView: View {
    @State private var showNotifications: Bool = false
    @State private var showMenu: Bool = false
    @State private var selectedTab: String = "Home"
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderView(showNotifications: $showNotifications, showMenu: $showMenu)
                
                Text("Content for \(selectedTab) tab")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
            }
            
            // Notification panel would go here
            if showNotifications {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showNotifications = false
                        }
                    }
                    .zIndex(1)
                
                NotificationView(dismiss: {
                    withAnimation {
                        showNotifications = false
                    }
                })
                .transition(.move(edge: .trailing))
                .zIndex(2)
            }
            
            NavigationDrawer(
                isOpen: $showMenu,
                selectedTab: $selectedTab,
                currentUserName: "Rakshath Maurya",
                currentUserID: "YR3COBBSC#####",
                currentUserEmail: "rakshath@student.nibm.lk",
                profileImageName: "profile_image"
            )
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showNotifications) {
            NotificationView(dismiss: {
                showNotifications = false
            })
        }
    }
}

#Preview {
    MainDashboardView()
}
