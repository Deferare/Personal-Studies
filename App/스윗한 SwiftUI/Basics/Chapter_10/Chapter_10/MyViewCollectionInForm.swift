//
//  MyViewCollectionInForm.swift
//  Chapter_10
//
//  Created by Deforeturn on 12/24/21.
//

import SwiftUI

struct MyViewCollectionInForm: View {
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("View").font(.headline)){
                    Text("Text")
                    Image(systemName: "gear").font(.title)
                    Rectangle()
                    Color.gray
                }
                Section(header: Text("Controll").font(.headline)){
                    Button("Button"){}
                    TextField("Place Holder", text: .constant("Secure Field"))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Place Holder2", text: .constant("Secure Field"))
                    Slider(value: .constant(0.5))
                    Toggle("Toggle", isOn: .constant(true))
                    Stepper("Stepper", onIncrement: {}, onDecrement: {})
                    Picker("Picker", selection: .constant("Option")) {Text("Option").tag("Option")}
                    DatePicker(selection: .constant(Date())){Text("DatePicker")}
                }
            }.navigationBarTitle("Form - View & Controll")
        }
    }
}

struct MyViewCollectionInForm_Previews: PreviewProvider {
    static var previews: some View {
        MyViewCollectionInForm()
    }
}
