//
//  StartUpView.swift
//  Pocket_Safari
//
//  Created by iOS Lab on 29/10/24.
//


import SwiftUI

struct StartUpView: View{
    let colorP = ColorPalette()
    @Binding var hasLaunchedBefore: Bool

        var body: some View {
            ZStack {
                colorP.pocketDarkGreen.ignoresSafeArea() // Background color
                VStack {
                    Text("Welcome to Pocket Safari!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()

                    Button(action: {
                        hasLaunchedBefore = true // Update flag
                    }) {
                        Text("Get Started")
                            .font(.headline)
                            .padding()
                            .background(colorP.pocketShadeGreen)
                            .foregroundColor(colorP.pocketDarkGreen)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }

#Preview {
    ContentView()
}
