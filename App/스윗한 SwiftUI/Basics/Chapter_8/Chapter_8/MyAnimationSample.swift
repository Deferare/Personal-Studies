//
//  ContentView.swift
//  Chapter_8
//
//  Created by Deforeturn on 12/22/21.
//

import SwiftUI

struct MyAnimationSample: View {
    @State private var ani_1 = false
    @State private var ani_2 = false
    @State private var ani_3 = false
    var body: some View {
        VStack{
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .scaleEffect(ani_1 ? 0.7 : 1)
                .onTapGesture {
                    self.ani_1.toggle()
                }
                .animation(.spring(response: 0.3, dampingFraction: 0.3))
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
                .scaleEffect(ani_2 ? 0.7 : 1)
                .onTapGesture {
                    withAnimation(.timingCurve(0, 0.5, 0, 0.7)){
                        self.ani_2.toggle()
                    }
                }
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.indigo)
                .scaleEffect(ani_3 ? 0.7 : 1)
                .onTapGesture {
                    self.ani_3.toggle()
                }
                .animation(.spring(response: 0.2, dampingFraction: 0.2).repeatForever(autoreverses: true))
        }
    }
}

struct MyAnimationSample_Previews: PreviewProvider {
    static var previews: some View {
        MyAnimationSample()
    }
}
