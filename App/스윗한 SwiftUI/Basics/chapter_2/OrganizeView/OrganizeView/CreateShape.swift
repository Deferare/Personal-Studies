//
//  ContentView.swift
//  OrganizeView
//
//  Created by Deforeturn on 12/7/21.
//

import SwiftUI

struct CreateShape: View {

    var body: some View {
        VStack(){
            HStack {
                Text("Create shape").font(.largeTitle).fontWeight(.heavy)
            }
            
            VStack{
                HStack {
                    Text("Round shape").font(.title)
                    Spacer()
                }
                ZStack{
                    Rectangle().frame(height: 10)
                    HStack{
                        Circle().fill(.yellow)
                        Ellipse().fill(.orange)
                        RoundedRectangle(cornerRadius: 30).fill(.gray)
                    }
                }
            }.padding(25)
            
            VStack{
                HStack {
                    Text("Acgular shape").font(.title)
                    Spacer()
                }
                ZStack{
                    Rectangle().frame(height: 10)
                    HStack{
                        Rectangle().foregroundColor(.red)
                        Rectangle().foregroundColor(.blue)
                        Rectangle().foregroundColor(.green)
                    }
                }
            }.padding(25)
        }
    }
}

struct CreateShape_Previews: PreviewProvider {
    static var previews: some View {
        CreateShape()
    }
}
