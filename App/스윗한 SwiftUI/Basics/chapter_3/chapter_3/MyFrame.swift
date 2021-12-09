//
//  MyFrame.swift
//  chapter_3
//
//  Created by Deforeturn on 12/9/21.
//

import SwiftUI

struct MyFrame: View {
    var body: some View {
        Text("Frame")
    }
}

struct MyFrame_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            HStack{
                Rectangle().fill(.red)
                    .fixedSize()
                    .frame(width: 50)
                    .background(.orange)
                    .frame(width: 50)
                    .fixedSize()
                    .frame(width: 60)
                    .background(.purple)
                Rectangle().fill(.green)
                    
                Rectangle().fill(.blue)
                    .frame(maxWidth: 100)
                    .fixedSize()
            }
            HStack{
                Color.red.layoutPriority(2)
                    .frame(minWidth:50)
                Color.green.layoutPriority(2)
                    .frame(minWidth:50)
                    .background(.purple)
                    .frame(width: 50)
                    .background(.cyan)
                    .frame(width: 50)
                    
                Color.blue.layoutPriority(2)
                    .frame(width: 100, height: 100)
                    .frame(width: 150)
                    .background(.cyan)
                    .frame(width: 250)
                    .background(.primary)
                    
            }
        }
    }
}
