//
//  MyPopover.swift
//  Chapter_5
//
//  Created by Deforeturn on 12/14/21.
//

import SwiftUI

struct MyPopover: View {
    @State var secondTurn = false
    var body: some View {
        VStack{
            HStack{
//                Spacer()
                Button(action: {secondTurn.toggle()}){
                    Text("Popover Button").font(.largeTitle)
                }
            }
        }
        .popover(isPresented: $secondTurn,
                 attachmentAnchor: .point(.bottomTrailing),
                 arrowEdge: .top,
                 content: popoverContents
        )
    }
    
    func popoverContents() -> some View{
        VStack{
            HStack{
                Spacer()
                Text("Popover View")
            }
        }
    }
}



struct MyPopover_Previews: PreviewProvider {
    static var previews: some View {
        MyPopover()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
    }
}
