//
//  ContentView.swift
//  Chapter_5
//
//  Created by Deforeturn on 12/13/21.
//

import SwiftUI

struct MyStateBinding: View {
    @State private var isFavorite = true
    @State private var count = 0
    var body: some View {
        VStack(spacing:10){
            Toggle(isOn: $isFavorite){
                Text("isFavorite: \(isFavorite.description)")
            }
            Stepper("Count: \(count)", value: $count)
        }
        .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

struct MyStateBinding_Previews: PreviewProvider {
    static var previews: some View {
        MyStateBinding()
    }
}
