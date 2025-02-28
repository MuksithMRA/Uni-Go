//
//  ProfileCardView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct ProfileCardView: View {
    let username: String
    let points: Int
    let progressValue: Double
    let progressGoal: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                // Profile avatar
                Image("profile_avatar")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Hello \(username),")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Image(systemName: "crown.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 24))
            }
            
            // Points display
            HStack {
                Text("You've earned")
                    .foregroundColor(.white)
                    .font(.headline)
                
                Spacer()
                
                HStack(spacing: 8) {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24))
                    
                    Text("\(points)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            
            // Progress bar
            VStack(alignment: .leading, spacing: 5) {
                Text("Reward Progress")
                    .foregroundColor(.white)
                    .font(.subheadline)
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        // Background track
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: geometry.size.width, height: 8)
                            .foregroundColor(.white.opacity(0.3))
                        
                        // Progress
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: geometry.size.width * progressValue, height: 8)
                            .foregroundColor(.white)
                    }
                }
                .frame(height: 8)
                
                Text("complete the progress to withdraw points")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.white)
                    
                    Text("\(Int(progressValue * 100))/\(progressGoal)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
        )
        .padding(.horizontal)
    }
}

// Preview
struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardView(
            username: "Rakshath",
            points: 50,
            progressValue: 0.4,
            progressGoal: 100
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
