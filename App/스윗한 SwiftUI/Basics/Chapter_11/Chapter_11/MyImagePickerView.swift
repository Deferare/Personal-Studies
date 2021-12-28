//
//  MyImagePickerView.swift
//  Chapter_11
//
//  Created by Deforeturn on 12/27/21.
//

import SwiftUI

struct MyImagePickerView: View {
    @State private var pickedImage = Image(systemName: "photo")
    @State private var isPickerPresented = false
    var body: some View {
        VStack{
            pickedImage
                .resizable()
                .frame(width: 300, height: 300)
                .padding(.bottom)
            Button(action: {self.isPickerPresented.toggle()}){
                Text("Show ImagePicker")
                    .bold()
            }
        }
        .sheet(isPresented: $isPickerPresented){
            ImagePickerView(pickedImage: $pickedImage)
        }
    }
}

struct MyImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MyImagePickerView()
    }
}
