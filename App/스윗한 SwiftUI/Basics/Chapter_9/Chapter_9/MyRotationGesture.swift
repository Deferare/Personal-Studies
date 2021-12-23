//
//  MyRotationGesture.swift
//  Chapter_9
//
//  Created by Deforeturn on 12/23/21.
//

import SwiftUI

struct MyRotationGesture: View {
    @GestureState private var angle:Angle = .zero
    var body: some View {
        VStack{
            Text("angle : \(angle.degrees)")
            let rotationGesture = RotationGesture()
                .updating($angle){(value, state, _) in
                    state = value
                }
            Capsule()
                .rotationEffect(angle)
                .gesture(rotationGesture)
        }
    }
}

struct MyRotationGesture_Previews: PreviewProvider {
    static var previews: some View {
        MyRotationGesture()
    }
}
