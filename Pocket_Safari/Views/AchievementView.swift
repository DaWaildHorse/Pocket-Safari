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
            Color.black.edgesIgnoringSafeArea(.all)
                
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green)
                    
                    Text("Lorem Ipsum")
                        .foregroundColor(.white)
                        .padding()
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                Spacer()
            }
        }
    }
}

#Preview {
    AchievementView()
}
