//
//  NextEventCardView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct NextEventCardView: View {
    let eventTitle: String
    let location: String
    let startTime: String
    let minutesRemaining: Int
    let eventImageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Next Event")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            HStack(spacing: 15) {
                // Event image
                Image(eventImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                
                // Event details
                VStack(alignment: .leading, spacing: 4) {
                    Text(eventTitle)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(location)
                        .font(.subheadline)
                    
                    Text("Lecture Start in \(minutesRemaining) mins")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Navigation chevron
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 20))
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        }
        .padding(.horizontal)
    }
}

// Preview
struct NextEventView_Previews: PreviewProvider {
    static var previews: some View {
        NextEventCardView(
            eventTitle: "IOS Lectures",
            location: "Harrison Hall",
            startTime: "12:30 PM",
            minutesRemaining: 30,
            eventImageName: "lecture_hall"
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
