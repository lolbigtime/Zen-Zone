//
//  LoadingView.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/7/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4) // Semi-transparent background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ProgressView() // Spinning progress indicator
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    .scaleEffect(2.0) // You can adjust the size as needed
                    .padding(20)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
            
            }
            .background(Color.black.opacity(0.8)) // Container background
            .cornerRadius(20)
            .padding(.horizontal)
        }
    }
}
