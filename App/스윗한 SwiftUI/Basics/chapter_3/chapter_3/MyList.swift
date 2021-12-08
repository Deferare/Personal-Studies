//
//  MyList.swift
//  chapter_3
//
//  Created by Deforeturn on 12/8/21.
//

import SwiftUI



struct MyList: View {
    let fruits = ["Apple", "Banana", "Grape"]
    let drinks = ["coca", "power", "soda", "watter", "a", "b", "c", "d"]
    var body: some View {
        List{
            Section{
                Text("\(fruits[0])").font(.largeTitle)
                ForEach(0..<drinks.count){
                    Text("\(drinks[$0])")
                }
            }
            Section{
                Text("\(fruits[0])").font(.largeTitle)
                ForEach(0..<drinks.count/2){
                    Text("\(drinks[$0])")
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
