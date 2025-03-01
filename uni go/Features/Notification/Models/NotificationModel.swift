//
//  NotificationModel.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct NotificationModel: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let timestamp: String
    let hasIcon: Bool
    let iconName: String
    let badgeCount: Int?
    let hasImage: Bool
    let timeAgo: String
    let image: String
}
