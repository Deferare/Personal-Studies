//
//  MyAlert.swift
//  Chapter_5
//
//  Created by Deforeturn on 12/14/21.
//

import SwiftUI

struct MyAlert: View {
    @State var cnt = 0
    @State var showingAler = false
    @State var alertName = "Alert"
    var body: some View {
        VStack{
            Button(action: {showingAler = true}){
                Text(alertName)
            }
            .alert(isPresented: $showingAler){
                Alert(
                    title: Text("Title"),
                    message: Text("message"),
                    primaryButton: .default(Text("Done")){
                        cnt += 1
                        alertName = "\(showingAler) - \(cnt)"
                        print("Done!")
                    },
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
        }
    }
}

struct MyAlert_Previews: PreviewProvider {
    static var previews: some View {
        MyAlert()
    }
}
