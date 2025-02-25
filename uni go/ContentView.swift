//
//  ContentView.swift
//  uni go
//
//  Created by HT Works on 2025-02-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 20) {
            
            Text("Welcome To UniGo")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your Campus Navigator")
                .font(.title2)
                .foregroundStyle(.gray)
            
            Spacer()
            
            MyButton(
                title: "Login",
                variant: .primary,
                size: .lg,
                width: .fixed(200)
            ){
                print( "Login pressed" )
            }
            MyButton(title: "Login", variant: .secondary, size: .md){
                print( "Login pressed" )
            }
            MyButton(title: "Login", variant: .outline, size: .xs){
                print( "Login pressed" )
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
