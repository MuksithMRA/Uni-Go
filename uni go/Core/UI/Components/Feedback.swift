//
//  Feedback.swift
//  uni go
//
//  Created by Menuka 046 on 2025-02-27.
//

import SwiftUI

struct Feedback:View {
    @State private var userInput: String = ""
    
    let columns=[
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    var body: some View {
        
        VStack{
            NavigationBar(title: "Feedback")
                .frame(maxWidth: 400,maxHeight: 100)
        }
        
        Image("feedback")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 270,
                   height: 270)
        Spacer()
        
        
        Text("Share Your Feedback")
            .font(.system(size: 24))
            .fontWeight(.bold)
            .foregroundStyle(.black)
        
        
        Text("Have questions or suggestions? We're here to help! Check out our FAQs or share your feedback to make Uni Go even better.")
            .font(.headline)
            .padding(20)
            .foregroundStyle(.black)
            .frame(maxWidth: 300)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
        
        Spacer()
        
        TextField("Add Your Feedback...", text: $userInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 300)
        
            .padding()
        
        
        MyButton(title: "Submit"){
        }
        .frame(maxWidth: 300)
        .padding()
        
    }
}

#Preview {
    Feedback()
}

