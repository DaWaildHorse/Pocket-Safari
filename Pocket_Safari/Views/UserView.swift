//
//  UserView.swift
//  Pocket_Safari
//
//  Created by iOS Lab on 29/10/24.
//
import SwiftUI

struct UserView: View {
    let colorP = ColorPalette()

    var body: some View {
        NavigationView {
            ZStack {
                colorP.pocketShadeGreen.ignoresSafeArea()
                GeometryReader { geometry in
                    ZStack {
                        CustomRectangle2()
                            .frame(width: geometry.size.width, height: geometry.size.height) // Fill the entire screen
                        
                        Image("Image2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.8, height: 250)
                            .padding()
                            .offset(x: 0, y: -190)

                        // Add navigation links here
                        VStack(spacing: 20) {
                            NavigationLink(destination: RegisterView()) {
                                Text("Register")
                                    .font(.title)
                                    .padding()
                                    .background(colorP.pocketDarkGreen)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .frame(width: 250) // Establecer un ancho fijo para todos los botones
                            }

                            NavigationLink(destination: OptionView()) {
                                Text("Options")
                                    .font(.title)
                                    .padding()
                                    .background(colorP.pocketDarkGreen)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .frame(width: 250) // Establecer el mismo ancho
                            }

                            NavigationLink(destination: NavigationBarView()) {
                                Text("Back")
                                    .font(.title)
                                    .padding()
                                    .background(colorP.pocketDarkGreen)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .frame(width: 250) // Establecer el mismo ancho
                            }
                        }
                        .padding()
                        .offset(y: 100) // Position buttons below the image
                    }
                }
            }
        }
    }
}

struct CustomRectangle2: View {
    let colorP = ColorPalette()

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(colorP.pocketShadeGreen)
            .frame(maxHeight: .infinity) // Allow height to be flexible
    }
}

#Preview {
    UserView()
}
