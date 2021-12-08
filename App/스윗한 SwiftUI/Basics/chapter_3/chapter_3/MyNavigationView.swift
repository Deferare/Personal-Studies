//
//  MyNavigationView.swift
//  chapter_3
//
//  Created by Deforeturn on 12/8/21.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        let itemL = Button(action: {print("Leading bar button")}){
            Image(systemName: "bell").imageScale(.large)
        }
        let itemR = Button(action: {print("Trailing bar button")}){
            Image(systemName: "gear").imageScale(.large)
        }
        NavigationView{
            let desti = Text("Destination View")
                .navigationBarBackButtonHidden(true)
            NavigationLink(destination: desti) {
                Image(systemName: "circle").font(.largeTitle)
            }
            .navigationBarTitle("Navi bar title", displayMode: .inline)
            .navigationBarItems(leading: itemL, trailing: itemR)

        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
