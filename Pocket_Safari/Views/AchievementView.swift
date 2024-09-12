//
//  AchievementView.swift
//  Pocket_Safari
//
//  Created by iOS Lab on 27/08/24.
//

import SwiftUI

struct AchievementView: View {
    let colorP = ColorPalette()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .edgesIgnoringSafeArea(.all) // This makes the black background cover the full screen
                
            VStack {
                // Green rectangle at the top
                Rectangle()
                    .fill(Color.green)
                    .frame(height: 50) // Adjust the height as needed
                    .cornerRadius(10)
                    .overlay(
                        Text("Lorem Ipsum")
                            .foregroundColor(.white)
                    )
                    .padding(.top, 20) // Adjust top margin
                    .padding(.horizontal, 20) // Adds horizontal margins

                Spacer() // Pushes the content down
            }
        }
    }
}

#Preview {
    AchievementView()
}
