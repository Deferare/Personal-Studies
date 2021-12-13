//
//  MyEnvironmentObject.swift
//  Chapter_5
//
//  Created by Deforeturn on 12/13/21.
//

import SwiftUI

struct MyEnvironmentObject: View {
    var body: some View {
        SuperView().environmentObject(User())
    }
}

struct SuperView: View{
    var body: some View{
        VStack{
            SubView()
            SubView()
        }
    }
}

struct SubView: View{
    @EnvironmentObject var user:User
    var body: some View{
        Button(action:{user.score += 1}){
            Text(user.score.description)
        }
    }
}


struct MyEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        MyEnvironmentObject()
    }
}
