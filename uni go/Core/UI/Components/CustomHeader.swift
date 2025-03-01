//
//  CustomHeader.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-03-01.
//

import SwiftUI

struct CustomHeader: View {
    var title: String
    var showBackButton: Bool = true
    var showPoints: Bool = false
    var pointsValue: Int = 0
    var showNotification: Bool = false
    var notificationCount: Int = 0
    var showMenu: Bool = true
    var onBackTapped: (() -> Void)? = nil
    var onNotificationTapped: (() -> Void)? = nil
    var onMenuTapped: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 16) {
            if showBackButton {
                Button(action: {
                    onBackTapped?()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                }
            }
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()
            
            if showPoints {
                HStack(spacing: 2) {
                    Image(systemName: "trophy.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 12))
                    
                    Text("\(pointsValue)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.yellow.opacity(0.3))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(Color.yellow, lineWidth: 1)
                        )
                )
            }
            
            if showNotification {
                Button(action: {
                    onNotificationTapped?()
                }) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "bell")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                        
                        if notificationCount > 0 {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 16, height: 16)
                                .overlay(
                                    Text("\(min(notificationCount, 99))")
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundColor(.white)
                                )
                                .offset(x: 8, y: -8)
                        }
                    }
                    .padding(4)
                }
            }
            
            if showMenu {
                Button(action: {
                    onMenuTapped?()
                }) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.white)
    }
}

extension CustomHeader {
    static func basic(title: String, onBackTapped: (() -> Void)? = nil) -> CustomHeader {
        CustomHeader(
            title: title,
            showBackButton: true,
            showPoints: false,
            showNotification: false,
            showMenu: false,
            onBackTapped: onBackTapped
        )
    }
    
    // Full header with all elements
    static func full(title: String,
                     pointsValue: Int,
                     notificationCount: Int,
                     onBackTapped: (() -> Void)? = nil,
                     onNotificationTapped: (() -> Void)? = nil,
                     onMenuTapped: (() -> Void)? = nil) -> CustomHeader {
        CustomHeader(
            title: title,
            showBackButton: true,
            showPoints: true,
            pointsValue: pointsValue,
            showNotification: true,
            notificationCount: notificationCount,
            showMenu: true,
            onBackTapped: onBackTapped,
            onNotificationTapped: onNotificationTapped,
            onMenuTapped: onMenuTapped
        )
    }
    
    // Custom header based on flags
    static func custom(title: String,
                       showBackButton: Bool = true,
                       showPoints: Bool = false,
                       pointsValue: Int = 0,
                       showNotification: Bool = false,
                       notificationCount: Int = 0,
                       showMenu: Bool = true,
                       onBackTapped: (() -> Void)? = nil,
                       onNotificationTapped: (() -> Void)? = nil,
                       onMenuTapped: (() -> Void)? = nil) -> CustomHeader {
        CustomHeader(
            title: title,
            showBackButton: showBackButton,
            showPoints: showPoints,
            pointsValue: pointsValue,
            showNotification: showNotification,
            notificationCount: notificationCount,
            showMenu: showMenu,
            onBackTapped: onBackTapped,
            onNotificationTapped: onNotificationTapped,
            onMenuTapped: onMenuTapped
        )
    }
}

// Preview provider
struct CustomHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CustomHeader.basic(title: "Basic Header")
            
            CustomHeader.full(
                title: "Full Header",
                pointsValue: 50,
                notificationCount: 2
            )
            
            CustomHeader.custom(
                title: "Custom Header",
                showBackButton: true,
                showPoints: true,
                pointsValue: 75,
                showNotification: false,
                showMenu: true
            )
        }
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
