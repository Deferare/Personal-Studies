//
//  ContentView.swift
//  Chapter_11
//
//  Created by Deforeturn on 12/27/21.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIImagePickerController{ // 필수
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        imagePickerController.allowsEditing = true
        return imagePickerController
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context){ // 필수
        
    }
    @Binding var pickedImage: Image
    final class Coordinator: NSObject{
        let parent: ImagePickerView
        init(_ imagePickerView: ImagePickerView){
            self.parent = imagePickerView
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
extension ImagePickerView.Coordinator: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let originalImage = info[.originalImage] as! UIImage
        let editedImage = info[.editedImage] as? UIImage
        let selectedImage = editedImage ?? originalImage
        parent.pickedImage = Image(uiImage: selectedImage)
        picker.dismiss(animated: true)
    }
}

