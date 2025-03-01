//
//  SettingsView.swift
//  uni go
//
//  Created by Cascade on 2025-03-01.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Text("Settings")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
                
                // Empty view for symmetry
                Color.clear
                    .frame(width: 24, height: 24)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.white)
            
            ScrollView {
                VStack(spacing: 24) {
                    // General Section
                    settingsSection(title: "General") {
                        // Theme Selector
                        settingsRow(title: "Change theme") {
                            Menu {
                                Button("Light") {
                                    viewModel.theme = "Light"
                                }
                                Button("Dark") {
                                    viewModel.theme = "Dark"
                                }
                                Button("System") {
                                    viewModel.theme = "System"
                                }
                            } label: {
                                HStack {
                                    Text(viewModel.theme)
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                    
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                }
                                .padding(.vertical, 4)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                )
                            }
                        }
                        
                        // Language Selector
                        settingsRow(title: "Change Language") {
                            Menu {
                                Button("English") {
                                    viewModel.language = "English"
                                }
                                Button("Sinhala") {
                                    viewModel.language = "Sinhala"
                                }
                                Button("Tamil") {
                                    viewModel.language = "Tamil"
                                }
                            } label: {
                                HStack {
                                    Text(viewModel.language)
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                    
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                }
                                .padding(.vertical, 4)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                )
                            }
                        }
                        
                        // Sync Events Toggle
                        settingsRow(title: "Sync Events") {
                            Toggle("", isOn: $viewModel.syncEvents)
                                .toggleStyle(SwitchToggleStyle(tint: .blue))
                                .labelsHidden()
                        }
                        
                        // Logout Button
                        settingsRow(title: "Logout") {
                            Button(action: {
                                // Logout action
                                viewModel.logout()
                                dismiss()
                            }) {
                                Text("Logout")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    
                    // Notifications Section
                    settingsSection(title: "Notifications") {
                        // Notifications Toggle
                        settingsRow(title: "Notifications") {
                            Toggle("", isOn: $viewModel.notifications)
                                .toggleStyle(SwitchToggleStyle(tint: .blue))
                                .labelsHidden()
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .navigationBarHidden(true)
    }
    
    // Helper function to create a settings section
    @ViewBuilder
    private func settingsSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            VStack(spacing: 0) {
                content()
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
    }
    
    // Helper function to create a settings row
    @ViewBuilder
    private func settingsRow<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.black)
            
            Spacer()
            
            content()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.white)
    }
}

#Preview {
    SettingsView()
}
