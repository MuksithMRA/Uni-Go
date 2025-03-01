//
//  MapView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-03-01.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Binding var searchText: String
    var places: [Place]
    @StateObject private var viewModel = MapViewModel()
    @State private var selectedPlace: Place?
    @State private var showingDirections = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Where do you want to go?", text: $searchText)
                    .font(.poppins(fontStyle: .callout, fontWeight: .medium))
                
                Image(systemName: "mic.fill")
                    .foregroundColor(.blue)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            )
            .padding()
            
            Map(coordinateRegion: $viewModel.region)
                .edgesIgnoringSafeArea(.bottom)
                .overlay(
                    viewModel.showDirections ? 
                    AnyView(
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: {
                                    viewModel.showDirections = false
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .shadow(radius: 3)
                                }
                                .padding()
                            }
                        }
                    ) : AnyView(EmptyView())
                )
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.black)
                    Text("Places")
                        .font(
                            .poppins(fontStyle: .callout, fontWeight: .semibold)
                        )
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(places, id: \.name) { place in
                            PlaceCardView(place: place)
                                .environmentObject(viewModel)
                                .frame(width: 180)
                                .onTapGesture {
                                    selectedPlace = place
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical, 10)
            .background(Color.white)
        }
        .onAppear {
            viewModel.places = places
        }
        .onChange(of: selectedPlace) { newPlace in
            if let place = newPlace {
                viewModel.selectedPlace = place
            }
        }
    }
}

extension PlaceCardView {
    func handleNavigation(using viewModel: MapViewModel) -> some View {
        var updatedView = self
        return updatedView.onTapGesture {
            viewModel.navigateToPlace(place)
        }
    }
}
