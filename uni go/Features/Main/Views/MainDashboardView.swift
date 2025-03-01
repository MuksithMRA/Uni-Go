//
//  MainDashboardView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI
import MapKit

struct MainDashboardView: View {
    @State private var showNotifications: Bool = false
    @State private var showMenu: Bool = false
    @State private var selectedMenu: String = "Home"
    @State private var selectedTab: TabBarView.TabItem = .home
    @State private var searchText = ""
    @StateObject private var viewModel = DashboardViewModel()
    @State private var navigationPath = NavigationPath()
    
    enum Destination {
        case profile
        case rewardStore
        case settings
        case feedback
        case faq
    }
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                VStack(spacing: 0) {
                    HeaderView(
                        showNotifications: $showNotifications,
                        showMenu: $showMenu,
                        points: 50
                    )
                    
                    TabView(selection: $selectedTab) {
                        HomeView(
                            userName: viewModel.userName,
                            userPoints: viewModel.userPoints,
                            nextEvent: viewModel.nextEvent,
                            searchedPlaces: viewModel.searchedPlaces
                        )
                        .tag(TabBarView.TabItem.home)
                        
                        MapView(
                            searchText: $searchText,
                            places: viewModel.places
                        )
                        .tag(TabBarView.TabItem.map)
                        
                        TripView(recentLocations: viewModel.recentLocations)
                            .tag(TabBarView.TabItem.trips)
                        
                        RewardView(
                            userPoints: viewModel.userPoints,
                            rewardHistory: viewModel.rewardHistory
                        )
                        .tag(TabBarView.TabItem.rewards)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    TabBarView(selectedTab: $selectedTab)
                }
                
                if showNotifications {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showNotifications = false
                            }
                        }
                        .zIndex(1)
                    
                    NotificationView(dismiss: {
                        withAnimation {
                            showNotifications = false
                        }
                    })
                    .transition(.move(edge: .trailing))
                    .zIndex(2)
                }
                
                NavigationDrawer(
                    isOpen: $showMenu,
                    selectedTab: $selectedMenu,
                    currentUserName: "Rakshath Maurya",
                    currentUserID: "YR3COBBSC#####",
                    currentUserEmail: "rakshath@student.nibm.lk",
                    profileImageName: "profile_image",
                    onMenuSelection: { selection in
                        handleMenuSelection(selection)
                    }
                )
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .profile:
                    ProfileView(nextEvent: viewModel.nextEvent)
                case .rewardStore:
                    RewardStoreView()
                case .settings:
                    Text("Settings Screen")
                case .feedback:
                    Text("Feedback Screen")
                case .faq:
                    Text("FAQ Screen")
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    private func handleMenuSelection(_ selection: String) {
        switch selection {
        case "Home":
            selectedTab = .home
        case "Places":
            selectedTab = .map
        case "RewardStore":
            navigationPath.append(Destination.rewardStore)
        case "Profile":
            navigationPath.append(Destination.profile)
        case "Settings":
            navigationPath.append(Destination.settings)
        case "Feedback":
            navigationPath.append(Destination.feedback)
        case "FAQ":
            navigationPath.append(Destination.faq)
        default:
            break
        }
    }
}

#Preview {
    MainDashboardView()
}
