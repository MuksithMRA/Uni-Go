//
//  DashboardViewModel.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import SwiftUI
import Combine

class DashboardViewModel: ObservableObject {
    @Published var userName: String = "Rakshath"
    @Published var userID: String = "YR4COBBSC#####"
    @Published var userEmail: String = "rakshath@student.nibm.lk"
    @Published var userPoints: Int = 50
    
    @Published var nextEvent: Event = Event(
        title: "IOS Lectures",
        location: "Harrison Hall",
        startTime: "13:30",
        remainingMinutes: 30,
        date: "01/02/2025",
        image: "lecHall_image"
    )
    
    @Published var searchedPlaces: [Place] = [
        Place(
            name: "CF - Canteen",
            floor: "5th block, computing faculty",
            distance: 400,
            crowdLevel: "Very Crowded",
            image: "canteen_image"
        ),
        Place(
            name: "CF - Canteen",
            floor: "5th block, computing faculty",
            distance: 400,
            crowdLevel: "Not Crowded",
            image: "canteen_image"
        )
    ]
    
    @Published var places: [Place] = [
        Place(
            name: "Harrison Hall",
            floor: "Computing Faculty",
            distance: 10,
            crowdLevel: "Not Crowded",
            startTime: "13:30",
            date: "01/02/2025",
            image: "lecHall_image"
        ),
        Place(
            name: "CF - Canteen",
            floor: "5th block, computing faculty",
            distance: 400,
            crowdLevel: "Very Crowded",
            image: "canteen_image"
        )
    ]
    
    @Published var recentLocations: [Place] = [
        Place(
            name: "Harrison Hall",
            floor: "Computing Faculty",
            distance: 10,
            crowdLevel: "",
            startTime: "13:30",
            date: "01/02/2025",
            image: "lecHall_image"
        ),
        Place(
            name: "Harrison Hall",
            floor: "Computing Faculty",
            distance: 10,
            crowdLevel: "",
            startTime: "13:30",
            date: "01/02/2025",
            image: "lecHall_image"
        ),
        Place(
            name: "Harrison Hall",
            floor: "Computing Faculty",
            distance: 10,
            crowdLevel: "",
            startTime: "13:30",
            date: "01/02/2025",
            image: "lecHall_image"
        ),
        Place(
            name: "Harrison Hall",
            floor: "Computing Faculty",
            distance: 10,
            crowdLevel: "",
            startTime: "13:30",
            date: "01/02/2025",
            image: "lecHall_image"
        ),
        Place(
            name: "Harrison Hall",
            floor: "Computing Faculty",
            distance: 10,
            crowdLevel: "",
            startTime: "13:30",
            date: "01/02/2025",
            image: "lecHall_image"
        ),
        Place(
            name: "Canteen",
            floor: "Ground Floor",
            distance: 400,
            crowdLevel: "Very Crowded",
            startTime: "13:30",
            date: "01/02/2025",
            image: "canteen_image"
        )
    ]
    
    @Published var rewardHistory: [RewardActivity] = [
        RewardActivity(title: "Credited as Dialog reload", points: 50, date: "01/02/2025", time: "13:30"),
        RewardActivity(title: "Updated Canteen Crowd Level", points: 4, date: "01/02/2025", time: "13:30"),
        RewardActivity(title: "Credited as Dialog reload", points: 50, date: "01/02/2025", time: "13:30"),
        RewardActivity(title: "Updated Canteen Crowd Level", points: 4, date: "01/02/2025", time: "13:30"),
        RewardActivity(title: "Credited as Dialog reload", points: 50, date: "01/02/2025", time: "13:30")
    ]
}
