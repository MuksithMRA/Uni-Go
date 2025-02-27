//
//  CardView.swift
//  uni go
//
//  Created by Menuka 046 on 2025-02-26.
//

import SwiftUI

struct CardView: View {
    var icon: String
    var text: String

    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.top)

            Text(text)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 5)
        }
        .frame(width: 100, height: 60)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
