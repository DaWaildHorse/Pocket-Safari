import SwiftUI
import UIKit

struct PhotoView: View {
    let capturedImage: Image?
    let colorP = ColorPalette() // Assuming you have a ColorPalette defined
    
    // Static data about the gorilla
    let gorillaName = "Western Lowland Gorilla"
    let scientificName = "Gorilla gorilla gorilla"
    let gorillaFact = """
    Gorillas are the largest living primates.
    They share 98% of their DNA with humans and are known for their intelligence and social behaviors.
    Gorillas live in groups called troops and are primarily herbivores, feeding on leaves, stems, and fruit.
    """

    let habitatFact = """
    Gorillas are typically found in the tropical forests of Central and West Africa. Their habitats range from lowland forests to mountainous regions.
    They tend to live in family groups called troops, led by a dominant male known as a silverback.
    """
    
    let behaviorFact = """
    Gorillas are highly social animals. They communicate with each other through vocalizations, gestures, and body language.
    Their behavior is often influenced by the presence of the dominant silverback, who leads the group and keeps it safe.
    """
    
    let conservationFact = """
    The Western Lowland Gorilla is critically endangered. The main threats to their survival are poaching, habitat destruction, and the Ebola virus.
    Many organizations are working on conservation efforts to protect gorillas from further threats.
    """
    
    let dietFact = """
    Gorillas are primarily herbivores. They eat leaves, fruit, bamboo, and other plant matter. Their diet may vary depending on the location, with some gorillas eating insects or small animals.
    """
    
    let intelligenceFact = """
    Gorillas are highly intelligent. They can learn sign language, use tools, and solve problems. In fact, some gorillas in captivity have been trained to use simple forms of communication to express their needs and emotions.
    """

    var body: some View {
        ZStack {
            if let image = capturedImage {
                image
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .clipped()
                    .scaleEffect(x: -1, y: 1)
            } else {
                colorP.pocketBlack.edgesIgnoringSafeArea(.all)
            }

            ScrollView {
                ZStack {
                    GeometryReader { geometry in
                        let scrollOffset = geometry.frame(in: .global).minY
                        let gradientOpacity = min(max(-scrollOffset / 300, 0), 1)
                        
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.clear,
                                colorP.pocketDarkGreen.opacity(gradientOpacity * 3),
                                colorP.pocketDarkGreen.opacity(1.0)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: geometry.size.height * 2)
                    }
                    
                    VStack(spacing: 20) {
                        // Static Information Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text(gorillaName)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text(scientificName)
                                .font(.title2)
                                .foregroundColor(.gray)
                            
                            Text(gorillaFact)
                                .font(.body)
                                .foregroundColor(.white)
                                .lineLimit(nil)
                        }
                        .padding()
                        .background(BlurView(style: .systemUltraThinMaterialDark)) // Apply custom blur effect here
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.top, 30)

                        // Dynamic content (the rectangles with added info)
                        VStack(spacing: 20) {
                            CustomRectangle(content: habitatFact, height: 800)
                            CustomRectangle(content: behaviorFact, height: 600)
                            CustomRectangle(content: conservationFact, height: 400)
                            CustomRectangle(content: dietFact, height: 300)
                            CustomRectangle(content: intelligenceFact, height: 200)
                        }
                    }
                    .frame(width: 450)
                    .padding(.bottom, 20) // Add space at the bottom so text doesn't touch the edge
                }
            }
        }
    }
}

struct CustomRectangle: View {
    let colorP = ColorPalette()
    var content: String // Content to display inside the rectangle
    let height: CGFloat // Accept height as a parameter

    var body: some View {
        VStack {
            Text(content)
                .font(.body)
                .foregroundColor(.white)
                .lineLimit(nil) // Allow unlimited lines
                .fixedSize(horizontal: false, vertical: true) // Ensures the text wraps and grows vertically
                .padding()
                .background(BlurView(style: .systemUltraThinMaterialDark))
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .padding(.top, 10)
        }
        .frame(width: 450, height: 150) // The height of the rectangle
        .padding(.horizontal, 20)
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style = .light
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

#Preview {
    ContentView()
}
