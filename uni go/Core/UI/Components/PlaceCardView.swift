//
//  PlaceCardView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct PlaceCardView: View {
    var place: Place
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(place.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
                    .clipped()
                
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .white)
                        .padding(8)
                        .background(Circle().fill(Color.white.opacity(0.7)))
                }
                .padding(8)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.blue)
                    
                    Text(place.name)
                        .font(.caption)
                        .fontWeight(.bold)
                        .lineLimit(1)
                }
                
                Text(place.floor)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                HStack {
                    Text("\(place.distance)m")
                        .font(.caption2)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                    
                    Spacer()
                }
                
                if !place.crowdLevel.isEmpty {
                    Text("Crowd level")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    
                    Text(place.crowdLevel)
                        .font(.caption)
                        .foregroundColor(place.crowdLevel == "Very Crowded" ? .red : .green)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(
                            place.crowdLevel == "Very Crowded" ? Color.red.opacity(0.1) : Color.green.opacity(0.1)
                        )
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
}
