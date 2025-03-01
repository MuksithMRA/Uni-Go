//
//  NotificationViewModels.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI
import Combine

class NotificationsViewModel: ObservableObject {
    @Published var notifications: [NotificationModel] = []
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        notifications = [
            NotificationModel(
                title: "Crowd Level Update 👥",
                message: "Canteen is very crowded now.",
                timestamp: "2 mins ago",
                hasIcon: true,
                iconName: "megaphone.fill",
                badgeCount: 24,
                hasImage: true,
                timeAgo: "2 mins ago",
                image: "canteen_image"
            ),
            NotificationModel(
                title: "IOS Lectures 📱",
                message: "IOS Lectures was two hours ago in Harrison Hall.",
                timestamp: "2 hours ago",
                hasIcon: true,
                iconName: "megaphone.fill",
                badgeCount: 24,
                hasImage: true,
                timeAgo: "2 hours ago",
                image: "lecHall_image"
            ),
            NotificationModel(
                title: "IOS Lectures 📱",
                message: "IOS Lectures was week ago in Harrison Hall.",
                timestamp: "Week ago",
                hasIcon: true,
                iconName: "tag.fill",
                badgeCount: nil,
                hasImage: true,
                timeAgo: "Week ago",
                image: "lecHall_image"
            )
        ]
    }
}
