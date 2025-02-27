//
//  CustomPopup.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-26.
//

import SwiftUI

struct CustomPopup<Content: View>: View {
    @Binding var isPresented: Bool
    var backgroundColor: Color = Color.black.opacity(0.4)
    var closeOnTapOutside: Bool = true
    let content: () -> Content
    
    var body: some View {
        ZStack {
            if isPresented {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        if closeOnTapOutside {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isPresented = false
                            }
                        }
                    }
                
                content()
                    .transition(.scale(scale: 0.9).combined(with: .opacity))
                    .animation(.spring(), value: isPresented)
            }
        }
    }
}
