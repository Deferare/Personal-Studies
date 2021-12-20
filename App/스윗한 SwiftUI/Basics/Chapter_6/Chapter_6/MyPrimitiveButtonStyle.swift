//
//  MyPrimitiveButtonStyle.swift
//  Chapter_6
//
//  Created by Deforeturn on 12/20/21.
//

import SwiftUI

struct MyPrimitiveButtonStyle: View {
    var body: some View {
        VStack{
            Button("Deforeturn"){print("Hi")}
            .buttonStyle(CustomePrimitiveButtonStyle())
            Button("Deforeturn2"){print("Hi")}
            .buttonStyle(CustomePrimitiveButtonStyle(minimunDuration: 1.0))
        }
    }
}

// MARK: -
struct MyPrimitiveButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        MyPrimitiveButtonStyle()
    }
}

// MARK: -
struct CustomePrimitiveButtonStyle: PrimitiveButtonStyle{
    var minimunDuration = 0.5
    func makeBody(configuration: Configuration) -> some View {
        ButtonStyleBody(configuration: configuration, minimunDuration: minimunDuration)
    }
    private struct ButtonStyleBody: View{
        let configuration: Configuration
        let minimunDuration: Double
        @GestureState private var ispressed = false
        var body: some View{
            let longPress = LongPressGesture(minimumDuration: minimunDuration)
                .updating($ispressed){ value, state, _ in
                    state = value
                }
                .onEnded{_ in self.configuration.trigger()}
            return configuration.label
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                .scaleEffect(ispressed ? 0.8 : 1.0)
                .opacity(ispressed ? 0.6 : 1.0)
                .gesture(longPress)
        }
    }
}
