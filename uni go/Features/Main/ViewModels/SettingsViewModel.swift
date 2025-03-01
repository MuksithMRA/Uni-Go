//
//  SettingsViewModel.swift
//  uni go
//
//  Created by Cascade on 2025-03-01.
//

import SwiftUI
import Combine

class SettingsViewModel: ObservableObject {
    // Published properties for settings
    @Published var theme: String = "Light"
    @Published var language: String = "English"
    @Published var syncEvents: Bool = true
    @Published var notifications: Bool = true
    
    // User defaults keys
    private let themeKey = "app_theme"
    private let languageKey = "app_language"
    private let syncEventsKey = "sync_events"
    private let notificationsKey = "notifications_enabled"
    
    // Cancellables for subscribers
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Load saved settings
        loadSettings()
        
        // Setup publishers to save settings when changed
        setupPublishers()
    }
    
    private func loadSettings() {
        let defaults = UserDefaults.standard
        
        theme = defaults.string(forKey: themeKey) ?? "Light"
        language = defaults.string(forKey: languageKey) ?? "English"
        syncEvents = defaults.bool(forKey: syncEventsKey)
        notifications = defaults.bool(forKey: notificationsKey)
    }
    
    private func setupPublishers() {
        let defaults = UserDefaults.standard
        
        // Save theme when changed
        $theme
            .dropFirst() // Skip the initial value
            .sink { [weak self] newValue in
                defaults.set(newValue, forKey: self?.themeKey ?? "")
            }
            .store(in: &cancellables)
        
        // Save language when changed
        $language
            .dropFirst()
            .sink { [weak self] newValue in
                defaults.set(newValue, forKey: self?.languageKey ?? "")
            }
            .store(in: &cancellables)
        
        // Save sync events setting when changed
        $syncEvents
            .dropFirst()
            .sink { [weak self] newValue in
                defaults.set(newValue, forKey: self?.syncEventsKey ?? "")
            }
            .store(in: &cancellables)
        
        // Save notifications setting when changed
        $notifications
            .dropFirst()
            .sink { [weak self] newValue in
                defaults.set(newValue, forKey: self?.notificationsKey ?? "")
            }
            .store(in: &cancellables)
    }
    
    // Function to handle logout
    func logout() {
        // Clear any user-specific data or tokens
        // For now, this is just a placeholder
        print("User logged out")
    }
}
