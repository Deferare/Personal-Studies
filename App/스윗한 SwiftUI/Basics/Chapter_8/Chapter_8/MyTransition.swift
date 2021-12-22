//
//  MyTransition.swift
//  Chapter_8
//
//  Created by Deforeturn on 12/22/21.
//

import SwiftUI

struct MyTransition: View {
    @State private var showText = false
    var body: some View {
        VStack{
            if showText{
                Text("Transition")
                    .font(.largeTitle)
                    .padding()
                    .transition(.scale.combined(with: .slide))
                Text("asymmetric")
                    .transition(self.myTransition)
            }
            Button("Display Text On / Off"){
                withAnimation{
                    self.showText.toggle()
                }
            }.font(.title)
        }
    }
    var myTransition: AnyTransition{
        let insertion = AnyTransition.offset(x: 300, y: -300).combined(with: .scale)
        let removal = AnyTransition.move(edge: .leading)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct MyTransition_Previews: PreviewProvider {
    static var previews: some View {
        MyTransition()
    }
}
