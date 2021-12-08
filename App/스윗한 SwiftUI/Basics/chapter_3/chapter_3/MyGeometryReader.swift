//
//  GeometryReader.swift
//  chapter_3
//
//  Created by Deforeturn on 12/8/21.
//

import SwiftUI

struct MyGeometryReader: View {
    var body: some View {
//        GeometryReader{ _ in
//            Circle().fill(.blue)
//                .frame(width: 350, height: 350)
//            Circle().fill(.red)
//                .frame(width: 250, height: 250)
//            Circle().fill(.green)
//                .frame(width: 150, height: 150)
//            Circle().fill(.cyan)
//                .frame(width: 50, height: 50)
//        }.background(.orange)
        
        GeometryReader{ geometry in
            Text("Geometry Reader")
                .font(.largeTitle).bold()
                .position(x: geometry.size.width/2, y: geometry.safeAreaInsets.top)
            VStack{
                Text("Size").bold()
                Text("width: \(Int(geometry.size.width))")
                Text("height: \(Int(geometry.size.height))")
            }
            .position(x: geometry.size.width/2, y: geometry.size.height/2.5)
            VStack{
                Text("SafeAreaInsets").bold()
                Text("top: \(Int(geometry.safeAreaInsets.top))")
                Text("bottom: \(Int(geometry.safeAreaInsets.bottom))")
            }.position(x: geometry.size.width/2, y: geometry.size.height/1.4)
        }
        .font(.title)
        .border(.green, width: 5)
    }
}

struct MyGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReader()
    }
}
