//
//  MyModifier.swift
//  Chapter_8
//
//  Created by Deforeturn on 12/22/21.
//

import SwiftUI

struct MyModifier: View {
    @State var turn = false
    var body: some View {
        VStack{
            if turn{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .transition(.modifier(active: CustomScaleModifier(scale:0.2), identity: CustomScaleModifier(scale:1)))

            }
            Button(turn ? "Off" : "On"){
                self.turn.toggle()
            }
        }
    }
}

struct CustomScaleModifier: ViewModifier{
    let scale: CGFloat
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
    }
}


struct MyModifier_Previews: PreviewProvider {
    static var previews: some View {
        MyModifier()
    }
}
