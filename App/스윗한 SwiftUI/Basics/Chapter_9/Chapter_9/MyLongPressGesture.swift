//
//  MyLongPressGesture.swift
//  Chapter_9
//
//  Created by Deforeturn on 12/23/21.
//

import SwiftUI

struct MyLongPressGesture: View {
    var body: some View {
        VStack{
            Circle().onLongPressGesture(){
                print("onLongPressGesture")
            }
            Circle().onLongPressGesture(minimumDuration: 0.5, maximumDistance: 10) {
                print("onLongPressGesture - perform")
            } onPressingChanged: { _ in
                print("onLongPressGesture - onPressingChanged")
            }

        }
    }
}

struct MyLongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        MyLongPressGesture()
    }
}
