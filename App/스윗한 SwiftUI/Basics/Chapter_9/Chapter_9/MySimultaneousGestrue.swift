//
//  MySimultaneousGestrue.swift
//  Chapter_9
//
//  Created by Deforeturn on 12/23/21.
//

import SwiftUI

struct MySimultaneousGestrue: View {
    var body: some View {
        let longPressGesture = LongPressGesture()
            .onChanged() {_ in
                print("long_onChanged.")
            }
            .onEnded() {_ in
                print("long_onEnded.")
            }
        let tapGestrue = TapGesture()
            .onEnded(){_ in
                print("tap_onEnded.")
            }
        VStack{
            Circle()
                .gesture(longPressGesture)
                .gesture(tapGestrue)

        }
    }
}

struct MySimultaneousGestrue_Previews: PreviewProvider {
    static var previews: some View {
        MySimultaneousGestrue()
    }
}
