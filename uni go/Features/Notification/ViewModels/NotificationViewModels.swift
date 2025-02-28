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
    @Published var selectedType: NotificationType? = .promo
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        notifications = [
            NotificationModel(
                title: "ඔලූ ගෙවමු Data දිනමු 😲",
                message: "Dialog Mobile හෝ HBB බිල්පත් ගෙවීමේදී📱 රු.1,000ට අඩු බිල්පත් සඳහා 2GB සහ රු.999ට වැඩි බිල්පත් සඳහා 5GB Data දිනාගන්න >> *T&CA",
                timestamp: "2 hours ago",
                hasIcon: true,
                iconName: "megaphone.fill",
                badgeCount: 24,
                hasImage: true,
                timeAgo: "2 hours ago",
                type: .promo
            ),
            NotificationModel(
                title: "Save in Style 😎 20% OFF",
                message: "📱Shop the latest mobile phones & accessories from Techsas for unbeatable quality & style! 🎁*T&CA",
                timestamp: "4 hours ago",
                hasIcon: true,
                iconName: "tag.fill",
                badgeCount: nil,
                hasImage: true,
                timeAgo: "4 hours ago",
                type: .promo
            ),
            NotificationModel(
                title: "Share WOW! 😉",
                message: "🚀 Invite & earn 💰 Rs. 50 eZ Cash! 🎉 Start sharing now! 💰 *T&CA",
                timestamp: "a day ago",
                hasIcon: true,
                iconName: "square.and.arrow.up.fill",
                badgeCount: nil,
                hasImage: true,
                timeAgo: "a day ago",
                type: .promo
            ),
            NotificationModel(
                title: "Pay & Win Data 🧑‍💼",
                message: "Pay your Dialog Mobile & HBB bills🏧 to get 2GB for pays under Rs.1,000 or 5GB for pays over Rs.999! *T&CA",
                timestamp: "2 days ago",
                hasIcon: true,
                iconName: "creditcard.fill",
                badgeCount: nil,
                hasImage: true,
                timeAgo: "2 days ago",
                type: .transaction
            ),
            NotificationModel(
                title: "3GB | අද විතරයි 💣",
                message: "ඔබ්මගේ Mega Games Play කරලා 3GB Data 🐕 ගෙදරටම දිනාගන්න ! *T&CA",
                timestamp: "2 days ago",
                hasIcon: true,
                iconName: "gamecontroller.fill",
                badgeCount: nil,
                hasImage: true,
                timeAgo: "2 days ago",
                type: .promo
            ),
            NotificationModel(
                title: "20% OFF on Techsas!💥",
                message: "Your Next Smart Move Just Got Smarter 📱 😎 Shop today for the best deals! *T&CA",
                timestamp: "2 days ago",
                hasIcon: true,
                iconName: "tag.fill",
                badgeCount: nil,
                hasImage: true,
                timeAgo: "2 days ago",
                type: .promo
            )
        ]
    }
    
    func getFilteredNotifications() -> [NotificationModel] {
        guard let selectedType = selectedType else {
            return notifications
        }
        return notifications.filter { $0.type == selectedType }
    }
}
