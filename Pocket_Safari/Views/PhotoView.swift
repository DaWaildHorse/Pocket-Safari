import SwiftUI
import UIKit

struct PhotoView: View {
    let capturedImage: Image?
    let colorP = ColorPalette() // Assuming you have a ColorPalette defined
    
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
                                                        colorP.pocketDarkGreen.opacity(gradientOpacity * 3), //
                                                        colorP.pocketDarkGreen.opacity(1.0) // Full opacity for the bottom
                                                    ]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                )                        .frame(height: geometry.size.height * 2)
                        .edgesIgnoringSafeArea(.all)
                    }
                    
                    VStack(spacing: 20) {
                        CustomRectangle(height: 800)
                            .padding(.horizontal, 40)
                        CustomRectangle(height: 600)
                            .padding(.horizontal, 40)
                        CustomRectangle(height: 400)
                            .padding(.horizontal, 40)
                        CustomRectangle(height: 300)
                            .padding(.horizontal, 40)
                        CustomRectangle(height: 200)
                            .padding(.horizontal, 40)
                    }
                }
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera // Change to .photoLibrary if desired
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No updates needed
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

struct CustomRectangle: View {
    let colorP = ColorPalette()
    let height: CGFloat // Accept height as a parameter

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(colorP.pocketGray)
            .frame(height: height)
    }
}

#Preview {
    ContentView()
}
