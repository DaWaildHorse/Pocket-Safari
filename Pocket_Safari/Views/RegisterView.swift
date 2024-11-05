//
//  RegisterView.swift
//  Pocket_Safari
//
//  Created by iOS Lab on 31/10/24.
//

import SwiftUI

struct RegisterView: View {
    let colorP = ColorPalette()
    
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                colorP.pocketShadeGreen.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Campo de texto para correo electrónico
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    // Campo de texto para nombre completo
                    TextField("Full Name", text: $fullName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    // Campo de texto para contraseña
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Spacer() // Para empujar el botón hacia abajo
                    
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
            .navigationTitle("Register") // Título de la vista
        }
    }
}

#Preview {
    RegisterView()
}
