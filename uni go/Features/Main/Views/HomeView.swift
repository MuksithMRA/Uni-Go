//
//  HomeView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-03-01.
//

import SwiftUI

struct HomeView: View {
    var userName: String
    var userPoints: Int
    var nextEvent: Event
    var searchedPlaces: [Place]
    @StateObject private var mapViewModel = MapViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ProfileCardView(
                    userName: userName,
                    points: userPoints
                )
                .padding(.horizontal)
                
                Text("Next Event")
                    .font(.poppins(fontStyle: .body, fontWeight: .semibold))
                    .padding(.horizontal)
                
                NextEventCardView(event: nextEvent)
                    .padding(.horizontal)
                
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .foregroundColor(.black)
                    Text("Most searched places")
                        .font(
                            .poppins(
                                fontStyle: .callout,
                                fontWeight: .semibold
                            )
                        )
                    Spacer()
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                    ForEach(searchedPlaces, id: \.name) { place in
                        PlaceCardView(place: place)
                            .environmentObject(mapViewModel)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .onAppear {
            mapViewModel.places = searchedPlaces
        }
    }
}
