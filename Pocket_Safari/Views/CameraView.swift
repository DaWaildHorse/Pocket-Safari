import SwiftUI

struct CameraView: View {
    @StateObject private var model = DataModel()
    @State private var navigateToPhotoView = false
    @State private var navigateToUserView = false // Estado para navegar a UserView


    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ViewfinderView(image: $model.viewfinderImage)
                    .overlay(alignment: .top) {
                        Color.black
                            .opacity(0.75)
                            .frame(height: geometry.size.height * 0.15)
                            .overlay(alignment: .topTrailing) {
                                Button(action: {
                                    navigateToUserView = true // Cambiar el estado para navegar a UserView
                                }) {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30) // Ajusta el tamaño según tus necesidades
                                        .padding()
                                }
                                .background(
                                    NavigationLink(destination: UserView(), isActive: $navigateToUserView) {
                                        EmptyView()
                                    }
                                    .hidden() // Ocultar el enlace para evitar interferencias visuales
                                )
                            }
                    }
                    .overlay(alignment: .bottom) {
                        buttonsView()
                            .frame(height: geometry.size.height * 0.15)
                            .background(.black.opacity(0.75))
                    }
                    .overlay(alignment: .center) {
                        Color.clear
                            .frame(height: geometry.size.height * 0.7)
                            .accessibilityElement()
                            .accessibilityLabel("View Finder")
                            .accessibilityAddTraits([.isImage])
                    }
                    .background(.black)
            }
            .task {
                await model.camera.start()
            }
            .navigationTitle("Camera")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .statusBar(hidden: true)
            .background(
                NavigationLink(destination: PhotoView(capturedImage: model.lastCapturedImage), isActive: $navigateToPhotoView) {
                    EmptyView()
                }
            )
        }
    }

    private func buttonsView() -> some View {
        HStack(spacing: 60) {
            Spacer()
            Button {
                model.camera.takePhoto { success in
                    if success {
                        navigateToPhotoView = true
                    } else {
                        print("Failed to take photo")
                    }
                }
            } label: {
                ZStack {
                    Circle()
                        .strokeBorder(.white, lineWidth: 3)
                        .frame(width: 62, height: 62)
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                }
            }

            Button {
                model.camera.switchCaptureDevice()
            } label: {
                Label("Switch Camera", systemImage: "arrow.triangle.2.circlepath")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
        .padding()
    }
}
