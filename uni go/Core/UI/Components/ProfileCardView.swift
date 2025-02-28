//
//  ProfileCardView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct ProfileCardView: View {
    var userName: String
    var points: Int
    @State private var progress: Double = 0.4
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image("profile_image")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hello \(userName),")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Image(systemName: "crown.fill")
                            .foregroundColor(.yellow)
                    }
                    
                    Text("You've earned")
                        .font(.subheadline)
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "gift.fill")
                        .foregroundColor(.yellow)
                    Text("\(points)")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            
            // Progress Bar
            VStack(alignment: .leading, spacing: 5) {
                Text("Reward Progress")
                    .font(.caption)
                    .fontWeight(.medium)
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 6)
                        .foregroundColor(Color.gray.opacity(0.2))
                        .cornerRadius(3)
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.8 * progress, height: 6)
                        .foregroundColor(.blue)
                        .cornerRadius(3)
                }
                
                HStack {
                    Spacer()
                    Text("40/100")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.2))
        .cornerRadius(12)
    }
}

// Preview
struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardView(
            userName: "Rakshath",
            points: 50
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
