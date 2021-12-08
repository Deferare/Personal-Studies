//
//  MyButton.swift
//  chapter_3
//
//  Created by Deforeturn on 12/8/21.
//

import SwiftUI

struct MyButton: View {
    var body: some View {
        VStack {
            HStack(spacing: 20){
                Button("Button"){
                    print("Button1")
                }
                Button(action: {print("Button2")}){
                    Text("Button")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                }
                Button(action: {print("Button3")}){
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width: 80, height: 80)
                        .overlay(Text("Button"))
                }
            }.padding()
            HStack(spacing: 20){
                Button(action: {print("Button1")}){
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                }
                Button(action: {print("Button2")}){
                   Image(systemName: "play.circle")
                        .imageScale(.large)
                        .font(.largeTitle)
                }
                .buttonStyle(PlainButtonStyle.plain)
            }.padding()
            HStack(spacing: 20){
                Image(systemName: "person.circle").imageScale(.large)
                    .onTapGesture {
                        print("onTapGesture")
                    }
                Button(action: {print("버튼")}){
                    Image(systemName: "person.circle").imageScale(.large)
                }
            }.padding()
        }
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton()
    }
}
