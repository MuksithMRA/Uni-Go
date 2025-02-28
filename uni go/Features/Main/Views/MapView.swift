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
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.906, longitude: 79.870),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
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
            
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.bottom)
            
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
                                .frame(width: 180)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical, 10)
            .background(Color.white)
        }
    }
}
