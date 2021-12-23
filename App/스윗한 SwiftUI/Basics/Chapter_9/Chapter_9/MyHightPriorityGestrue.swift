//
//  MyHightPriorityGestrue.swift
//  Chapter_9
//
//  Created by Deforeturn on 12/23/21.
//

import SwiftUI

struct MyHightPriorityGestrue: View {
    var body: some View {
        let tapGesture = TapGesture()
            .onEnded(){
                print("사각형 탭.")
            }
        VStack{
            Rectangle()
            Circle()
                .onTapGesture {
                    print("원형 탭")
                }
        }
        .highPriorityGesture(tapGesture)
    }
}

struct MyHightPriorityGestrue_Previews: PreviewProvider {
    static var previews: some View {
        MyHightPriorityGestrue()
    }
}
