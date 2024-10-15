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
                    

                    CustomRectangle2()
                        .padding(.horizontal, 40)
                        .padding()
                    CustomRectangle3()
                        .padding(.horizontal, 40)
                        .padding()
                    CustomRectangle4()
                        .padding(.horizontal, 40)
                        .padding()
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

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 800)
            .padding()
    }
}

struct CustomRectangle2: View {
    let colorP = ColorPalette()

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(colorP.pocketGray)
            .frame(height: 50)
            .padding(.top, -300)
    }
}

struct CustomRectangle3: View {
    let colorP = ColorPalette()

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(colorP.pocketGray)
            .frame(height: 400)
            .padding(.top, -50)
    }
}

struct CustomRectangle4: View {
    let colorP = ColorPalette()

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(colorP.pocketGray)
            .frame(height: 150)
            .padding(.top, 550)
    }
}

#Preview {
    ContentView()
}

