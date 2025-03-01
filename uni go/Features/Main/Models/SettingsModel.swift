//
//  SettingsModel.swift
//  uni go
//
//  Created by Cascade on 2025-03-01.
//

import Foundation

// Theme options
enum AppTheme: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
}

// Language options
enum AppLanguage: String, CaseIterable {
    case english = "English"
    case sinhala = "Sinhala"
    case tamil = "Tamil"
}

// Settings model
struct UserSettings {
    var theme: AppTheme
    var language: AppLanguage
    var syncEvents: Bool
    var notifications: Bool
    
    // Default settings
    static let defaultSettings = UserSettings(
        theme: .light,
        language: .english,
        syncEvents: true,
        notifications: true
    )
}
