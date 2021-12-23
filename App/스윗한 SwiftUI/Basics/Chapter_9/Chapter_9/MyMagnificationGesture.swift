//
//  MyMagnificationGesture.swift
//  Chapter_9
//
//  Created by Deforeturn on 12/23/21.
//

import SwiftUI

struct MyMagnificationGesture: View {
    @GestureState private var scale = CGFloat(1)
    @State private var latesScale = CGFloat(1)
    var body: some View {
        VStack{
            let magnificationGesture = MagnificationGesture()
                .updating($scale) {(value, state, _) in
                    state = value
                }.onEnded() { scale in
                    self.latesScale *= scale
                }
            Circle()
                .scaleEffect(latesScale * scale)
                .gesture(magnificationGesture)
        }
    }
}

struct MyMagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        MyMagnificationGesture()
    }
}
