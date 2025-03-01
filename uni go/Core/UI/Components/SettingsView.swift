//
//  SettingsView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-03-01.
//

import SwiftUI

struct SettingsView: View {
    @State private var theme = "Light"
    @State private var language = "English"
    @State private var syncEvents = true
    @State private var notifications = true
    
    var body: some View {
        Text("Settings")
    }
}
