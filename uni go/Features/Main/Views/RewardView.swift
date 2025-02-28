//
//  RewardView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-03-01.
//

import SwiftUI

struct RewardView: View {
    var userPoints: Int
    var rewardHistory: [RewardActivity]
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Image(systemName: "gift.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.yellow)
                
                Text("\(userPoints)")
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Go to Store")
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(12)
            .padding(.horizontal)
            
            Text("2024/06/06 - 2024/06/06")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(rewardHistory, id: \.title) { activity in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(activity.title)
                                    .font(.headline)
                                Text("\(activity.date) \(activity.time)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "gift.fill")
                                    .foregroundColor(.yellow)
                                Text("+\(activity.points)")
                                    .foregroundColor(activity.points >= 10 ? .orange : .green)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}
