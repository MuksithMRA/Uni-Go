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

struct Place {
    var name: String
    var floor: String
    var distance: Int
    var crowdLevel: String
    var startTime: String = ""
    var date: String = ""
    var image: String = "lecture_hall"
}

struct RewardActivity {
    var title: String
    var points: Int
    var date: String
    var time: String
}
