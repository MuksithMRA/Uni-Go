//
//  DashboardModel.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import Foundation

// Data model for Places
struct PlaceData: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let distance: String
    let crowdLevel: String
    let isCrowded: Bool
    let responseRate: Int
    let imageName: String
    let isFavorite: Bool
}

// Model for user data
struct UserData {
    let name: String
    let id: String
    let email: String
    let profileImage: String
}

// Model for profile information
struct ProfileInfo {
    let username: String
    let points: Int
    let progressValue: Double
    let progressGoal: Int
}

// Model for event information
struct EventInfo {
    let title: String
    let location: String
    let startTime: String
    let minutesRemaining: Int
    let imageName: String
}

// Model for notification
struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let time: String
    let isNew: Bool
}
