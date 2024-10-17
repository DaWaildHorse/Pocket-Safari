//
//  ContentView.swift
//  Pocket_Safari
//
//  Created by iOS Lab on 27/08/24.
//

import SwiftUI

struct ContentView: View {
    let colorP = ColorPalette()
    @State private var isActive = false
    
    var body: some View {
        
        if isActive {
                NavigationBarView()
                    .ignoresSafeArea(.all) // Your main app content
                } else {
                    PantallaCargaView() // Your splash screen
                        .onAppear {
                            // Delay for the splash screen
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                withAnimation {
                                    isActive = true
                                }
                            }
                        }
                }
        
        
        
        
        
        
        
       
    }
}

#Preview {
    ContentView()
}
