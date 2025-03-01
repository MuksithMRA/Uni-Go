//
//  DashboardModel.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-28.
//

import Foundation

struct Event {
    var title: String
    var location: String
    var startTime: String
    var remainingMinutes: Int
    var date: String
    var image: String = "lecture_hall"
}

struct Place: Equatable {
    var name: String
    var floor: String
    var distance: Int
    var crowdLevel: String
    var startTime: String = ""
    var date: String = ""
    var image: String = "lecture_hall"
    
    // Implementing Equatable manually to ensure proper comparison
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.name == rhs.name &&
               lhs.floor == rhs.floor &&
               lhs.distance == rhs.distance &&
               lhs.crowdLevel == rhs.crowdLevel &&
               lhs.startTime == rhs.startTime &&
               lhs.date == rhs.date &&
               lhs.image == rhs.image
    }
}

struct RewardActivity {
    var title: String
    var points: Int
    var date: String
    var time: String
}
