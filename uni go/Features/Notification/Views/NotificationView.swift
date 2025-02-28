//
//  NotificationView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct NotificationView: View {
    @StateObject private var viewModel = NotificationsViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            // Navigation bar
            NotificationHeaderView(dismiss: dismiss)
            
            // Tab selection
            NotificationCategoryTabView(viewModel: viewModel)
            
            // Notification list
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.getFilteredNotifications()) { notification in
                        NotificationItemView(notification: notification)
                            .padding(.bottom, 1)
                    }
                }
            }
            .background(Color(UIColor.systemGray6))
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct NotificationHeaderView: View {
    var dismiss: DismissAction
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            
            Text("Notifications")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading, 8)
            
            Spacer()
            
            Button(action: {
                // More options menu
            }) {
                Image(systemName: "ellipsis.vertical")
                    .font(.title2)
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.white)
    }
}

struct NotificationCategoryTabView: View {
    @ObservedObject var viewModel: NotificationsViewModel
    
    let categories: [(NotificationType, String, String)] = [
        (.promo, "Promos", "megaphone.fill"),
        (.transaction, "Transactions", "dollarsign.circle"),
        (.alert, "Alerts", "envelope.badge"),
        (.chat, "Chats", "bubble.left.and.bubble.right")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(categories, id: \.0) { type, name, icon in
                    VStack {
                        ZStack {
                            Circle()
                                .fill(type == .promo ? Color.red : Color(UIColor.systemGray5))
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: icon)
                                .font(.title2)
                                .foregroundColor(type == .promo ? .white : .gray)
                            
                            if type == .promo {
                                ZStack {
                                    Circle()
                                        .fill(Color.orange)
                                        .frame(width: 24, height: 24)
                                    
                                    Text("24")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .offset(x: 18, y: -18)
                            } else if type == .alert {
                                ZStack {
                                    Circle()
                                        .fill(Color.orange)
                                        .frame(width: 24, height: 24)
                                    
                                    Text("1")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .offset(x: 18, y: -18)
                            }
                        }
                        
                        Text(name)
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical, 8)
                    .onTapGesture {
                        viewModel.selectedType = type
                    }
                }
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .padding(.bottom, 8)
    }
}

struct NotificationItemView: View {
    let notification: NotificationModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(notification.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(notification.message)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                    
                    HStack {
                        Button(action: {
                            // More action
                        }) {
                            Text("More...")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Text(notification.timeAgo)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 2)
                }
                
                if notification.hasImage {
                    Image(systemName: "square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.leading, 6)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(2)
    }
}

#Preview {
    NotificationView()
}
