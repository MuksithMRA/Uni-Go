//
//  MyPopup.swift
//  uni go
//
//  Created by Pavithra Chamod on 2025-02-26.
//

import SwiftUI

struct MyPopup: View {
    var title: String
    var message: String
    var primaryButtonTitle: String = "OK"
    var secondaryButtonTitle: String? = nil
    var primaryAction: () -> Void = {}
    var secondaryAction: () -> Void = {}
    var isShowing: Binding<Bool>
    
    var body : some View {
        ZStack {
            if isShowing.wrappedValue {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isShowing.wrappedValue = false
                    }
                
                VStack(spacing: 20) {
                    Text(title)
                        .font(
                            .poppins(fontStyle: .headline, fontWeight: .medium)
                        )
                        .foregroundStyle(.black)
                    
                    Text(message)
                        .font(
                            .poppins(fontStyle: .caption, fontWeight: .semibold)
                        )
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 1)
                    
                    HStack {
                        if secondaryButtonTitle != nil {
                            Button(action: {
                                secondaryAction()
                                isShowing.wrappedValue = false
                            }){
                                Text(secondaryButtonTitle!)
                                    .font(
                                        .poppins(
                                            fontStyle: .caption2,
                                            fontWeight: .semibold
                                        )
                                    )
                                    .foregroundStyle(.gray)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                            }
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 1, height: 44)
                        }
                        
                        Button(action: {
                            primaryAction()
                            isShowing.wrappedValue = false
                        }){
                            Text(primaryButtonTitle)
                                .font(
                                    .poppins(
                                        fontStyle: .caption2,
                                        fontWeight: .semibold
                                    )
                                )
                                .foregroundStyle(.blue)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
                .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
                .frame(maxWidth: 300)
                .shadow(color: Color.black.opacity(0.1), radius: 10)
                .transition(.scale)
                .animation(.spring(), value: isShowing.wrappedValue)
            }
        }
    }
}

struct MyPopup_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Single button alert
                MyPopup(
                    title: "Success",
                    message: "You have successfully signed in to your account.",
                    isShowing: .constant(true)
                )
                
                // Two button alert
                MyPopup(
                    title: "Confirm Action",
                    message: "Are you sure you want to proceed with this action?",
                    primaryButtonTitle: "Yes",
                    secondaryButtonTitle: "Cancel",
                    isShowing: .constant(true)
                )
            }
        }
    }
}
