//
//  BottomMenu.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/4/23.
//

import SwiftUI
import PhotosUI

struct BottomMenu: View {
    @ObservedObject var userModel: UserModel
    @State private var photoItem: PhotosPickerItem?
    @State private var photo: UIImage?
    @State private var isImagePickerPresented = false
    @ObservedObject var bottomSheetManager: SheetManager
    @Binding var isLoading: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Avatar")
                    .customFont(.title2, fontSize: 20)
                Spacer()
            }
            Button(action: {
                // Set the flag to present the image picker
                isLoading = true
                isImagePickerPresented.toggle()
            }) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Change Avatar")
                        .customFont(.title2, fontSize: 16)
                    Text("Upload a PNG or JPG. Images should be in a 1:1 format")
                        .customFont(.body, fontSize: 12)
                }
            }
            VStack(alignment: .leading, spacing: 3) {
                Text("Switch Banner")
                    .customFont(.title2, fontSize: 16)
                Text("Choose a banner to decorate your avatar with!")
                    .customFont(.body, fontSize: 12)
            }
            
            Spacer()
                .frame(height: 110)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(Color("Background 2"))
        .cornerRadius(20 )
        .transition(.move(edge: .bottom))
        .photosPicker(isPresented: $isImagePickerPresented, selection: $photoItem)
        .onChange(of: photoItem) { _ in
            Task {
                if let data = try? await photoItem?.loadTransferable(type: Data.self) {
                    print(data, "sucess")
                    
                    if let uiImage = UIImage(data: data) {
                        userModel.profileImage = uiImage
                        withAnimation {
                            bottomSheetManager.dismiss()
                            isLoading = false

                        }
                            
                    }
                }
            }
        }
        
    }
}
/*
struct ImagePickerView: View {
    @Binding var image: Image?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ImagePicker(image: $image) { selectedImage in
            image = selectedImage
            presentationMode.wrappedValue.dismiss()
        }
    }
}
*/
