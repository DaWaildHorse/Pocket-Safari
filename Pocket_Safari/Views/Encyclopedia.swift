import SwiftUI

struct EncyclopediaView: View {
    let colorP = ColorPalette()
    
    var body: some View {
        ZStack {
            colorP.pocketBlack.edgesIgnoringSafeArea(.all) // Background color across the entire view
            
            ScrollView {
                VStack(spacing: 20) {
                    // encyclopdia based on the fauna and flora discovered
                    SkeletonRectangle(colorP: colorP)
                    SkeletonRectangle(colorP: colorP)
                }
                .padding()
            }
        }
    }
}

struct SkeletonRectangle: View {
    let colorP: ColorPalette
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(colorP.pocketDarkGreen)
                .frame(height: 500) // Height for the entire rectangle
            
            VStack(alignment: .leading, spacing: 20) {
                // Image placeholder at the top
                Rectangle()
                    .fill(colorP.pocketGray) // Image placeholder color
                    .frame(height: 80)
                    .cornerRadius(10)
                    .padding(.top, -110) // Reduce top margin of the image placeholder

                // Skeleton text placeholders (need to make a loop here uwu)
                VStack() {
                    Rectangle()
                        .fill(colorP.pocketGray) // Text placeholder
                        .frame(height: 20) // Placeholder for text line 1

                    Rectangle()
                        .fill(colorP.pocketGray)
                        .frame(height: 20) // Placeholder for text line 2

                    Rectangle()
                        .fill(colorP.pocketGray)
                        .frame(height: 20) // Placeholder for text line 3
                }
                .padding(.top, 20) // Reduced spacing between image and text
            }
            .padding() // Padding inside the rectangle
        }
        .padding() // Padding around the rectangle
    }
}

#Preview {
    EncyclopediaView() 
}
