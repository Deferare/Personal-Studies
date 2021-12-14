//
//  MyPresentationStyle.swift
//  Chapter_5
//
//  Created by Deforeturn on 12/14/21.
//

import SwiftUI

struct MyPresentationStyle: View {
    @State private var showingSheet = false
    @State private var btnName = "Present"
    @State var user = User()
    var body: some View {
        Button(action: {showingSheet.toggle()}){
            Text(btnName)
                .font(.title).foregroundColor(.blue)
        }
        .sheet(
            isPresented: $showingSheet,
            onDismiss: {btnName = "Present - \(user.score.description)"},
            content: {PresentedView(user: $user)}
        )
    }
}

struct PresentedView: View{
    @Environment(\.presentationMode) var presentationMode
    @Binding var user:User
    var body: some View {
        Button(action: {
            if self.presentationMode.wrappedValue.isPresented{
                self.presentationMode.wrappedValue.dismiss()
            }
            user.score += 1
        }){
            Text(user.score.description)
        }
    }
}


struct MyPresentationStyle_Previews: PreviewProvider {
    static var previews: some View {
        MyPresentationStyle()
    }
}
