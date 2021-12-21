//
//  MyScrollView2.swift
//  Chapter_7
//
//  Created by Deforeturn on 12/21/21.
//

import SwiftUI

struct MyScrollView2: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Text("Vertical ScrollView").font(.largeTitle)
                ScrollView{
                    ForEach(0..<10){ i in
                        Circle()
                            .fill(Color(white:0.2 + (0.8 * Double(i) / 10)))
                            .frame(width: 80, height: 80)
                    }
                    .frame(width: geometry.size.width / 2)
                }
                .frame(height: geometry.size.height / 2)
                .padding(.bottom)
                
                Text("Horizontal ScrollView").font(.largeTitle)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(0..<10){ i in
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.yellow)
                                .frame(width: 100, height: 100)
                                .scaleEffect(1 - (0.7 * CGFloat(1) / 10))
                        }
                    }
                    .frame(height: geometry.size.height / 5)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct MyScrollView2_Previews: PreviewProvider {
    static var previews: some View {
        MyScrollView2()
    }
}
