//
//  PlaceCardView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct PlaceCardView: View {
    let title: String
    let location: String
    let distance: String
    let crowdLevel: String
    let isCrowded: Bool
    let responseRate: Int
    let imageName: String
    var isFavorite: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 120)
                    .clipped()
                
                Button(action: {
                    // Toggle favorite action
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .white)
                        .padding(8)
                        .background(Circle().fill(Color.white.opacity(0.3)))
                        .padding(8)
                }
            }
            
            // Place info
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.blue)
                    
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("Open")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                
                Text(location)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(distance)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Divider()
                
                // Crowd level
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Crowd Level")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Button(action: {
                            // Request live update action
                        }) {
                            Text("REQUEST LIVE")
                                .font(.system(size: 10))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.blue)
                                .cornerRadius(4)
                        }
                    }
                    
                    HStack {
                        Text(crowdLevel)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(isCrowded ? .red : .green)
                        
                        Spacer()
                        
                        Text("\(responseRate)% Response")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

struct SearchedPlacesView: View {
    let places: [PlaceData]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image(systemName: "magnifyingglass.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                
                Text("Most searched places")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(places) { place in
                        PlaceCardView(
                            title: place.title,
                            location: place.location,
                            distance: place.distance,
                            crowdLevel: place.crowdLevel,
                            isCrowded: place.isCrowded,
                            responseRate: place.responseRate,
                            imageName: place.imageName,
                            isFavorite: place.isFavorite
                        )
                        .frame(width: 180)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

// Preview
struct SearchedPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchedPlacesView(places: [
            PlaceData(
                title: "CF - Canteen",
                location: "5th block, computing faculty",
                distance: "400m",
                crowdLevel: "Very Crowd",
                isCrowded: true,
                responseRate: 90,
                imageName: "canteen",
                isFavorite: false
            ),
            PlaceData(
                title: "CF - Canteen",
                location: "5th block, computing faculty",
                distance: "400m",
                crowdLevel: "Very Crowd",
                isCrowded: true,
                responseRate: 90,
                imageName: "canteen",
                isFavorite: true
            )
        ])
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
