//
//  MyTapView.swift
//  Chapter_7
//
//  Created by Deforeturn on 12/21/21.
//

import SwiftUI

struct MyTapView: View {
    var body: some View {
        TabView{
            VStack{
                Text("First tab view").font(.largeTitle)
                Image(systemName: "circle.fill").font(.largeTitle).foregroundColor(.indigo)
            }.tabItem{
                Image(systemName: "house")
                Text("Item1")
            }
            
            Text("Second tab view")
                .font(.title)
                .padding()
                .background(.yellow)
                .tabItem{
                    Image(systemName: "cube")
                    Text("Item2")
                }
            
            SomeView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Item3")
                }
        }
    }
}
struct SomeView: View{
    var body: some View{
        VStack{
            Text("Exaully like this.")
            Text("Might use by ohter view.")
        }.font(.title)
    }
}

struct MyTapView_Previews: PreviewProvider {
    static var previews: some View {
        MyTapView()
    }
}
