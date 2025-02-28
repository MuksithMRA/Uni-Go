//
//  TripView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-03-01.
//

import SwiftUI

struct TripView: View {
    var recentLocations: [Place]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(recentLocations, id: \.name) { place in
                        HStack {
                            Image(place.image)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading) {
                                Text(place.name)
                                    .font(.headline)
                                Text("\(place.date) \(place.startTime)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("\(place.distance) mins")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                Text("Navigate")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.blue)
                                    .cornerRadius(15)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}
