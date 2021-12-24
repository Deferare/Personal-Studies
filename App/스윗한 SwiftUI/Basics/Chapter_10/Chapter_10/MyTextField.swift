//
//  MyTextField.swift
//  Chapter_10
//
//  Created by Deforeturn on 12/24/21.
//

import SwiftUI

struct MyTextField: View {
    @State private var textValue = ""
    @State private var emailField = ""
    var body: some View {
        Form{
            TextField("Place Hold", text: $textValue)
                .textFieldStyle(.plain)
            TextField("Place Hold", text: $textValue)
                .textFieldStyle(.roundedBorder)
            TextField("Place Hold", text: $textValue)
                .onAppear {UITextField.appearance().borderStyle = .bezel}
            HStack{
                Image(systemName: "envelope").frame(width: 30)
                TextField("Email", text: $emailField)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                Image(systemName: "envelope").frame(width: 30)
                TextField("Email", text: $emailField)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).stroke(.gray.opacity(0.6), lineWidth: 1))
                    
            }
        }
        
    }
}

struct MyTextField_Previews: PreviewProvider {
    static var previews: some View {
        MyTextField()
    }
}
