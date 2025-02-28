//
//  FAQView.swift
//  uni go
//
//  Created by Menuka 046 on 2025-02-26.
//

import SwiftUI

struct FAQView:View {
    
    let columns=[
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    var body: some View {
        
        VStack{
            NavigationBar(title: "FAQs")
        }
        
        Image("FAQs")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 270,
                   height: 270)
        Spacer()
        
        
        Text("How Can We help ?")
            .font(.system(size: 24))
            .fontWeight(.bold)
            .foregroundStyle(.black)
        
        
        Text("Need help? Check out our FAQs for quick answers!")
            .font(.headline)
            .padding(20)
            .foregroundStyle(.black)
            .frame(maxWidth: 300)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
        
        Spacer()
        
        LazyVGrid(columns: columns, spacing: 20){
            CardView(icon: "general", text: "General")
            CardView(icon: "location", text: "Locations")
            CardView(icon: "updates", text: "Updates")
            CardView(icon: "support", text: "Support")
        }
        .padding(40)
        
    }
}

#Preview {
    FAQView()
}

