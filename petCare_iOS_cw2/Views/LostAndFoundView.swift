//
//  LostAndFoundView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI
import PhotosUI

struct LostAndFoundView: View {
    @State private var isLost = true
    @State private var petName = ""
    @State private var lastSeenLocation = ""
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Lost & Found Pets")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)

                // Toggle
                Toggle(isOn: $isLost) {
                    Text(isLost ? "Lost Pet" : "Found Pet")
                        .fontWeight(.medium)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .padding(.horizontal)

                // Text fields
                VStack(spacing: 12) {
                    TextField("Pet Name", text: $petName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Last Seen Location", text: $lastSeenLocation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)

                // Image Upload Section
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.systemGray6))
                        .frame(height: 180)

                    VStack {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 50, height: 40)
                                .foregroundColor(.gray)
                            Text("Upload Image")
                                .foregroundColor(.blue)
                                .font(.callout)
                        }
                    }
                }
                .padding(.horizontal)

                // Buttons
                Button(action: {
                    showImagePicker = true
                }) {
                    Text("Choose Image")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Button(action: {
                    // Action for reporting lost pet
                }) {
                    Text("Report Lost Pet")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
    }
}

// Image Picker Helper
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker
        init(_ parent: ImagePicker) { self.parent = parent }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            guard let provider = results.first?.itemProvider,
                  provider.canLoadObject(ofClass: UIImage.self) else { return }

            provider.loadObject(ofClass: UIImage.self) { image, _ in
                DispatchQueue.main.async {
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
}

#Preview {
    LostAndFoundView()
}
