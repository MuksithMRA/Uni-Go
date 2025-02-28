//
//  DashboardViewModel.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI
import Combine

class DashboardViewModel: ObservableObject {
    
    @Published var showNotifications = false
    @Published var showMenu = false
    @Published var selectedTab: TabBarView.TabItem = .home
    @Published var selectedDrawerTab: String = "Home"
    
    // User data
    let userData = UserData(
        name: "Rakshath Maurya",
        id: "YR3COBBSC#####",
        email: "rakshath@student.nibm.lk",
        profileImage: "profile_image"
    )
    
    // Profile information
    let profileInfo = ProfileInfo(
        username: "Abdul",
        points: 50,
        progressValue: 0.4,
        progressGoal: 100
    )
    
    // Next event information
    let nextEvent = EventInfo(
        title: "IOS Lectures",
        location: "Harrison Hall",
        startTime: "1:00 PM",
        minutesRemaining: 30,
        imageName: "lecture_hall"
    )
    
    // Sample notifications
    let notifications = [
        NotificationItem(
            title: "IOS Lecture",
            message: "Your lecture starts in 30 minutes",
            time: "12:00 PM",
            isNew: true
        ),
        NotificationItem(
            title: "Points Added",
            message: "You've earned 10 new points!",
            time: "Yesterday",
            isNew: true
        ),
        NotificationItem(
            title: "New Event",
            message: "CS Department is organizing a hackathon",
            time: "2 days ago",
            isNew: false
        )
    ]
    
    // Most searched places
    let searchedPlaces = [
        PlaceData(
            title: "CF - Canteen",
            location: "5th block, computing faculty",
            distance: "400m",
            crowdLevel: "Very Crowd",
            isCrowded: true,
            responseRate: 90,
            imageName: "canteen_image",
            isFavorite: false
        ),
        PlaceData(
            title: "CF - Canteen",
            location: "5th block, computing faculty",
            distance: "400m",
            crowdLevel: "Very Crowd",
            isCrowded: true,
            responseRate: 90,
            imageName: "canteen_image",
            isFavorite: true
        )
    ]
    
    func handleDrawerTabSelection(tab: String) {
        selectedDrawerTab = tab
        
        showMenu = false
        
        // Handle navigation based on the selected tab
        // (In a real app, you'd implement proper navigation here)
    }
}
