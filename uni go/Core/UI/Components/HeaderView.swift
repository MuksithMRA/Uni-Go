//
//  HeaderView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-27.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showNotifications: Bool
    @Binding var showMenu: Bool
    @State private var notificationCount: Int = 5
    
    var body: some View {
        HStack {
            Button(action: {
                print("Sign In link tapped")
            }){
                HStack(spacing: 5)
                {
                    ZStack{
                        Circle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 50, height: 50)
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60,
                                   height: 60)
                    }
                    
                    VStack
                    {
                        HStack(spacing: 0){
                            Text("Uni")
                                .font(
                                    .poppins(
                                        fontStyle: .headline, fontWeight: .regular
                                    )
                                )
                                .foregroundStyle(.black)
                            
                            Text("GO")
                                .font(
                                    .poppins(
                                        fontStyle: .headline,
                                        fontWeight: .regular
                                    )
                                )
                                .foregroundStyle(.blue)
                        }
                        Text("Campus Navigator")
                            .font(
                                .poppins(fontStyle: .footnote, fontWeight: .regular)
                            )
                            .foregroundStyle(.black)
                    }
                }
                
            }
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    showNotifications.toggle()
                    
                    if showMenu {
                        showMenu = false
                    }
                }
            }) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                    
                    if notificationCount > 0 {
                        Text("\(notificationCount)")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 5, y: -5)
                    }
                }
                .padding(.horizontal, 10)
            }
            
            Button(action: {
                withAnimation(.easeInOut) {
                    showMenu.toggle()
                    
                    if showNotifications {
                        showNotifications = false
                    }
                }
            }) {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
        .frame(height: 60)
        .background(Color.white)
    }
}

// Preview
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(
            showNotifications: .constant(false),
            showMenu: .constant(false)
        )
    }
}
