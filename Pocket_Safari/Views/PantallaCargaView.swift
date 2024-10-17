import SwiftUI

struct PantallaCargaView: View {
    let colorP = ColorPalette()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                CustomRectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height) // Fill the entire screen
                
                Image("Image2")
                    .resizable() //
                    .aspectRatio(contentMode: .fit) //
                    .frame(width: geometry.size.width * 0.8, height: 500) //
                    .padding() //
            }
        }
        .edgesIgnoringSafeArea(.all) // Ignore safe area to fill the screen completely
    }

    struct CustomRectangle: View {
        let colorP = ColorPalette()

        var body: some View {
            RoundedRectangle(cornerRadius: 20)
                .fill(colorP.pocketShadeGreen)
                .frame(maxHeight: .infinity) // Allow height to be flexible
        }
    }
}

#Preview {
    PantallaCargaView()
}
