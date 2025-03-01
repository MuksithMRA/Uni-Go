//
//  RewardStoreView.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-03-01.
//

import SwiftUI

struct RewardStoreView: View {
    let rewardItems: [RewardItem] = [
        RewardItem(title: "Dialog LKR 50 Reload", imageName: "Dialog_logo", points: 50),
        RewardItem(title: "Dialog LKR 100 Reload", imageName: "Dialog_logo", points: 100),
        RewardItem(title: "Dialog LKR 500 Reload", imageName: "Dialog_logo", points: 500)
    ]
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(spacing: 0) {
            CustomHeader.custom(
                title: "Rewards Store",
                showPoints: false,
                showNotification: false,
                showMenu: false,
                onBackTapped: {
                    dismiss()
                }
            )
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
            
            HStack {
                Spacer()
                
                Button(action: {
                    print("More options tapped")
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .padding(.trailing, 16)
                        .padding(.top, 8)
                }
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                    ForEach(rewardItems) { item in
                        RewardCardView(item: item)
                    }
                }
                .padding(16)
            }
            .background(Color.gray.opacity(0.05))
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
}

//Preview
struct RewardsStoreView_Previews: PreviewProvider {
    static var previews: some View {
        RewardStoreView()
    }
}
