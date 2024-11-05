//
//  OptionView.swift
//  Pocket_Safari
//
//  Created by iOS Lab on 31/10/24.
//

import SwiftUI

struct OptionView: View {
    let colorP = ColorPalette()
    
    @State private var volume: Double = 50 // Valor inicial del volumen
    @State private var brightness: Double = 50 // Valor inicial del brillo

    var body: some View {
        NavigationView {
            ZStack {
                colorP.pocketShadeGreen.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Barra de volumen
                    VStack {
                        Text("Brightness")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Slider(value: $volume, in: 0...100, step: 1)
                            .accentColor(colorP.pocketDarkGreen)
                    }
                    .padding()

                    // Barra de brillo
                    VStack {
                        Text("Adjust font size")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Slider(value: $brightness, in: 0...100, step: 1)
                            .accentColor(colorP.pocketDarkGreen)
                    }
                    .padding()
                    
                    Spacer() // Empuja el botón hacia abajo
                    
                    // Botón para volver a UserView
                    NavigationLink(destination: UserView()) {
                        Text("Back")
                            .font(.title)
                            .padding()
                            .background(colorP.pocketDarkGreen)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20) // Espaciado en la parte inferior
                }
                .padding() // Espaciado alrededor del VStack
            }
            .navigationTitle("Options") // Título de la vista
        }
    }
}

#Preview {
    OptionView()
}
