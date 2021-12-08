//
//  MyNavigationViewStyle.swift
//  chapter_3
//
//  Created by Deforeturn on 12/8/21.
//

import SwiftUI

struct MyNavigationViewStyle: View {
    var body: some View {
        NavigationView{
            VStack(spacing:20){
                NavigationLink(destination: Text("Detail view area1 ").font(.largeTitle)){
                    Text("Master View menu1").font(.title)
                }
                NavigationLink(destination: Text("Detail view area2 ").font(.largeTitle)){
                    Text("Master View menu2").font(.title)
                }
            }
            .navigationBarTitle("Navigation View style")
            Text("Detail View").font(.largeTitle)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MyNavigationViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationViewStyle()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
