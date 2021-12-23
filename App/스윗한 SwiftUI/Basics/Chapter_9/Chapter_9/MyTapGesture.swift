//
//  ContentView.swift
//  Chapter_9
//
//  Created by Deforeturn on 12/23/21.
//

import SwiftUI

struct MyTapGesture: View {
    var body: some View {
        VStack{
            Circle().onTapGesture(){
                print("Tap.")
            }
            Circle().onTapGesture(count: 2){
                print("Tap - count_2")
            }
            let tapGesture = TapGesture(count: 3).onEnded({print("Tap - count_3")})
            Circle().gesture(tapGesture)
        }
    }
    
    
}

struct MyTapGesture_Previews: PreviewProvider {
    static var previews: some View {
        MyTapGesture()
    }
}
