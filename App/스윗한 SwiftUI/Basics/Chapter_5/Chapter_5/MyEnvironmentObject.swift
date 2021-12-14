//
//  MyEnvironmentObject.swift
//  Chapter_5
//
//  Created by Deforeturn on 12/13/21.
//

import SwiftUI

struct MyEnvironmentObject: View {
    var body: some View {
        VStack(spacing: 30){
            SuperView().environmentObject(User())
        }
    }
}

struct SuperView: View{
    var body: some View{
        VStack{
            SubView()
        }
    }
}

struct SubView: View{
    @EnvironmentObject var user:User
    @EnvironmentObject var user2:User
    var body: some View{
        VStack{
            Button(action:{user.score += 1}){
                Text(user.score.description)
            }
            Button(action:{user2.score += 1}){
                Text(user.score.description)
            }
        }
    }
}

struct MyEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        MyEnvironmentObject()
    }
}
