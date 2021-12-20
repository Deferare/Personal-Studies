//
//  ContentView.swift
//  Chapter_6
//
//  Created by Deforeturn on 12/20/21.
//

import SwiftUI

struct MyViewModifier: View {
    var body: some View {
        VStack{
            Text("Hello, world!")
                .modifier(CustomViewModifier(borderColor: .cyan))
            Text("Concat")
                .modifier(MainColor())
                .modifier(MainFont())
            Text("Extension.")
                .customModifier(myBorderColor: .indigo)
        }
    }
}

struct CustomViewModifier: ViewModifier{
    var borderColor: Color = .red
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(Rectangle().fill(.gray))
            .border(borderColor, width: 2)
    }
}

struct MainColor: ViewModifier{
    var colorMain:Color = .orange
    func body(content: Content) -> some View {
        content
            .foregroundColor(colorMain)
    }
}
struct MainFont: ViewModifier{
    var FontMain:Font = .largeTitle
    func body(content: Content) -> some View {
        content
            .font(FontMain)
    }
}




// MARK: -
struct MyViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        MyViewModifier()
    }
}

// MARK: - Extension
extension View{
    func customModifier(myBorderColor: Color) -> some View{
        self
            .modifier(CustomViewModifier(borderColor: myBorderColor))
    }
}
