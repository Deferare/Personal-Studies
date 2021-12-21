//
//  ContentView.swift
//  Chapter_7
//
//  Created by Deforeturn on 12/21/21.
//

import SwiftUI

struct MyScrollView: View {
    var body: some View {

        VStack{
            ScrollView{
                Rectangle()
                    .frame(height: 30)
                Rectangle()
                    .frame(height: 30)
                Rectangle()
                    .frame(height: 30)
            }
            ScrollView(.horizontal){
                HStack{
                    Rectangle()
                        .frame(width: 300)
                    Rectangle()
                        .frame(width: 300)
                    Rectangle()
                        .frame(width: 300)
                }
            }
        }
        
    }
}

struct MyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrollView()
    }
}
