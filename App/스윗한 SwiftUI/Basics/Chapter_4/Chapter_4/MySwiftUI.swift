//
//  MySwiftUI.swift
//  Chapter_4
//
//  Created by Deforeturn on 12/10/21.
//

import SwiftUI

struct MySwiftUI: View {
    let dog1 = Animal(id: 1, name: "ChoCo1", age: 1)
    let dog2 = Animal(id: 2, name: "ChoCo2", age: 2)
    let dog3 = Animal(id: 3, name: "ChoCo3", age: 3)
    var body: some View {
        VStack{
            ForEach([dog1, dog2, dog3]){ ani in
                Text(ani.name)
            }
        }
    }
}

struct MySwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        MySwiftUI()
    }
}

struct Animal: Identifiable{
    let id:Int
    let name:String
    let age:Int
}



