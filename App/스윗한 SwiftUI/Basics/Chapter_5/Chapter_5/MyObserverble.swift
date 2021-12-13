//
//  MyObserverble.swift
//  Chapter_5
//
//  Created by Deforeturn on 12/13/21.
//

import SwiftUI

struct MyObserverble: View {
    @ObservedObject var user1 = User()
    var body: some View {
        Button(action: {self.user1.score += 1}){
            Text(user1.score.description)
        }
    }
}

struct MyObserverble_Previews: PreviewProvider {
    static var previews: some View {
        MyObserverble()
    }
}


class User: ObservableObject{
    let name = "Choco"
    @Published var score = 0
}
