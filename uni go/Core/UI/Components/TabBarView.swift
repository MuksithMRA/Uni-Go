//
//  TabBarView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: TabItem
    
    enum TabItem {
        case home, map, trips, rewards
    }
    
    var body: some View {
        HStack{
            Spacer()
            
            VStack(spacing: 4) {
                Image(systemName: "house.fill")
                    .font(.system(size: 20))
                Text("Home")
                    .font(.poppins(fontStyle: .footnote, fontWeight: .medium))
            }
            .foregroundColor(selectedTab == .home ? .blue : .gray)
            .onTapGesture {
                selectedTab = .home
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Image(systemName: "map")
                    .font(.system(size: 20))
                Text("Map")
                    .font(.poppins(fontStyle: .footnote, fontWeight: .medium))
            }
            .foregroundColor(selectedTab == .map ? .blue : .gray)
            .onTapGesture {
                selectedTab = .map
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Image(systemName: "arrow.triangle.swap")
                    .font(.system(size: 20))
                Text("Trips")
                    .font(.poppins(fontStyle: .footnote, fontWeight: .medium))
            }
            .foregroundColor(selectedTab == .trips ? .blue : .gray)
            .onTapGesture {
                selectedTab = .trips
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Image(systemName: "gift.fill")
                    .font(.system(size: 20))
                Text("Rewards")
                    .font(.poppins(fontStyle: .footnote, fontWeight: .medium))
            }
            .foregroundColor(selectedTab == .rewards ? .blue : .gray)
            .onTapGesture {
                selectedTab = .rewards
            }
            
            Spacer()
        }
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
        )
    }
}

// Preview
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.home))
            .previewLayout(.sizeThatFits)
    }
}
