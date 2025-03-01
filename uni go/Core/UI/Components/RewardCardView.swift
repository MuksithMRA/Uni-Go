//
//  RewardCardView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-03-01.
//

import SwiftUI

struct RewardItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let points: Int
}

struct RewardCardView: View {
    let item: RewardItem
    var onGetTapped: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 10) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .padding(.top, 16)
            
            Text(item.title)
                .font(.system(size: 14, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
            
            Spacer()
            
            HStack {
                HStack(spacing: 4) {
                    Image(systemName: "medal.fill")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 14))
                    
                    Text("\(item.points)")
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                MyButton(
                    title: "Get",
                    variant: .primary,
                    size: .sm,
                    width: .fixed(70),
                    action: {
                        
                    }
                )
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 20)
        }
        .frame(height: 180)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

// Preview
struct RewardCardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardCardView(
            item: RewardItem(
                title: "Dialog LKR 50 Reload",
                imageName: "Dialog_logo",
                points: 50
            )
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
