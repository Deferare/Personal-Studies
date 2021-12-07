//
//  OverLayBackground2.swift
//  OrganizeView
//
//  Created by Deforeturn on 12/7/21.
//

import SwiftUI

struct OverLayBackground2: View {
    var body: some View {
        
        VStack {
            Circle()
                .fill(.yellow.opacity(0.5))
                .frame(width: 250, height: 250)
                .overlay(Image(systemName: "arrow.up.right.circle.fill").font(.title), alignment: .topTrailing)
                .overlay(Text("Joystict").font(.largeTitle))
                .overlay(Image(systemName: "arrow.up").font(.title).padding(), alignment: .top)
                .overlay(Image(systemName: "arrow.left").font(.title).padding(), alignment: .leading)
                .background(Image(systemName: "arrow.right").font(.title).padding(), alignment: .trailing)
            .background(Image(systemName: "arrow.down").font(.title).padding(), alignment: .bottom)
            
            ZStack{
                VStack{
                    Spacer()
                    Image(systemName: "arrow.down").font(.title).padding()
                }
                HStack{
                    Spacer()
                    Image(systemName: "arrow.right").font(.title).padding()
                }
                Circle()
                    .fill(.cyan.opacity(0.5))
                    .frame(width: 250, height: 250)
                Text("Joystict").font(.largeTitle)
                ZStack(alignment: .topTrailing){
                    Color.clear
                    Image(systemName: "arrow.up.right.circle.fill").font(.title)
                }
                VStack{
                    Image(systemName: "arrow.up").font(.title).padding()
                    Spacer()
                }
                HStack{
                    Image(systemName: "arrow.left").font(.title).padding()
                    Spacer()
                }
            }.frame(width: 250, height: 250)
        }
    }
}

struct OverLayBackground2_Previews: PreviewProvider {
    static var previews: some View {
        OverLayBackground2()
    }
}
