//
//  NavigationBar.swift
//  uni go
//
//  Created by Menuka 046 on 2025-02-26.
//

import SwiftUI

struct NavigationBar:View {
    var title:String
    
    var body: some View {
        
        HStack{
            Image("icon-left")
                .padding(.leading)
            
            Spacer()
                .frame(width: 0)
            
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding()
        .padding(.top, 40)
    }
}

