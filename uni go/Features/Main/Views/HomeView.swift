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
    @Binding var searchText: String
    @Binding var selectedTab: TabBarView.TabItem
    @StateObject private var mapViewModel = MapViewModel()
    
    init(userName: String, userPoints: Int, nextEvent: Event, searchedPlaces: [Place], searchText: Binding<String>, selectedTab: Binding<TabBarView.TabItem>) {
        self.userName = userName
        self.userPoints = userPoints
        self.nextEvent = nextEvent
        self.searchedPlaces = searchedPlaces
        self._searchText = searchText
        self._selectedTab = selectedTab
    }
    
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
                        PlaceCardView(place: place, selectedTab: $selectedTab)
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
