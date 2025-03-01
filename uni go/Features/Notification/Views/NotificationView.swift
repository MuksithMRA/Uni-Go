//
//  NotificationView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct NotificationView: View {
    @StateObject private var viewModel = NotificationsViewModel()
    var dismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            NotificationHeaderView(dismiss: dismiss)
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.notifications) { notification in
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
    var dismiss: () -> Void
    
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
                .font(.poppins(fontStyle: .subheadline, fontWeight: .medium))
                .fontWeight(.bold)
                .padding(.leading, 8)
            
            Spacer()
            
            Button(action: {
                
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

struct NotificationItemView: View {
    let notification: NotificationModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(notification.title)
                        .font(.poppins(fontStyle: .body, fontWeight: .medium))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(notification.message)
                        .font(.poppins(fontStyle: .footnote, fontWeight: .medium))
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                    
                    HStack {
                        Button(action: {
                            
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
                    Image(notification.image)
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
        .navigationBarBackButtonHidden(true)
    }
}

// Preview provider
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(dismiss: {})
    }
}
