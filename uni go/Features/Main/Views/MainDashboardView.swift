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
    @State private var navigateToProfile: Bool = false
    @State private var navigateToRewardStore: Bool = false
    @State private var navigateToSettings: Bool = false
    @State private var navigateToFeedback: Bool = false
    @State private var navigateToFAQ: Bool = false
    
    var body: some View {
        NavigationView {
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
            .background(
                NavigationLink(destination: ProfileView(nextEvent: viewModel.nextEvent), isActive: $navigateToProfile) {
                    EmptyView()
                }
            )
            .background(
                NavigationLink(destination: RewardStoreView(), isActive: $navigateToRewardStore) {
                    EmptyView()
                }
            )
            //            .background(
            //                NavigationLink(destination: SettingsView(), isActive: $navigateToSettings) {
            //                    EmptyView()
            //                }
            //            )
            //            .background(
            //                NavigationLink(destination: FeedbackView(), isActive: $navigateToFeedback) {
            //                    EmptyView()
            //                }
            //            )
            //            .background(
            //                NavigationLink(destination: FAQView(), isActive: $navigateToFAQ) {
            //                    EmptyView()
            //                }
            //            )
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func handleMenuSelection(_ selection: String) {
        switch selection {
        case "Home":
            selectedTab = .home
        case "Places":
            selectedTab = .map
        case "RewardStore":
            navigateToRewardStore = true
        case "Profile":
            navigateToProfile = true
        case "Settings":
            navigateToSettings = true
        case "Feedback":
            navigateToFeedback = true
        case "FAQ":
            navigateToFAQ = true
        default:
            break
        }
    }
}

//struct SettingsView: View {
//    var body: some View {
//        VStack {
//            CustomHeader.custom(
//                title: "Settings",
//                showPoints: false,
//                showNotification: false,
//                showMenu: false,
//                onBackTapped: {
//                    print("Back tapped")
//                }
//            )
//            Spacer()
//            Text("Settings Screen")
//            Spacer()
//        }
//        .navigationBarHidden(true)
//    }
//}
//
//struct FeedbackView: View {
//    var body: some View {
//        VStack {
//            CustomHeader.custom(
//                title: "Feedback",
//                showPoints: false,
//                showNotification: false,
//                showMenu: false,
//                onBackTapped: {
//                    print("Back tapped")
//                }
//            )
//            Spacer()
//            Text("Feedback Screen")
//            Spacer()
//        }
//        .navigationBarHidden(true)
//    }
//}
//
//struct FAQView: View {
//    var body: some View {
//        VStack {
//            CustomHeader.custom(
//                title: "FAQ",
//                showPoints: false,
//                showNotification: false,
//                showMenu: false,
//                onBackTapped: {
//                    print("Back tapped")
//                }
//            )
//            Spacer()
//            Text("FAQ Screen")
//            Spacer()
//        }
//        .navigationBarHidden(true)
//    }
//}

#Preview {
    MainDashboardView()
}
