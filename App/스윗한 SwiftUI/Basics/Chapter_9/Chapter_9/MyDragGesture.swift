//
//  MyDragGesture.swift
//  Chapter_9
//
//  Created by Deforeturn on 12/23/21.
//

import SwiftUI

struct MyDragGesture: View {
    @GestureState private var translation:CGSize = .zero
    var body: some View {
        let dragGesture = DragGesture()
            .updating($translation){(value, state, _) in
                state = value.translation
            }
        VStack{
            Circle()
                .offset(translation)
                .gesture(dragGesture)
        }
    }
}

struct MyDragGesture_Previews: PreviewProvider {
    static var previews: some View {
        MyDragGesture()
    }
}
