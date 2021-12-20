//
//  MyButtonStyle.swift
//  Chapter_6
//
//  Created by Deforeturn on 12/20/21.
//

import SwiftUI

struct MyButtonStyle: View {
    var body: some View {
        VStack{
            Button(action: {print("Hi")}){Text("Hi")}
            Button("Hi2"){}.buttonStyle(CustomButtonStyle(backgroundColor: .indigo))
            Button("Hi2"){}.buttonStyle(CustomButtonStyle())
        }
    }
}


// MARK: - PreView
struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        MyButtonStyle()
    }
}

//struct ButtonStyleConfiguration{
//    let label: ButtonStyleConfiguration.Label
//    let isPressed:Bool
//}

struct CustomButtonStyle: ButtonStyle{
    var backgroundColor = Color.blue
    var cornerRadius = CGFloat(6)
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(backgroundColor))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
