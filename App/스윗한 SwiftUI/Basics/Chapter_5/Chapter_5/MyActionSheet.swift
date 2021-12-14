//
//  MyActionSheet.swift
//  Chapter_5
//
//  Created by Deforeturn on 12/14/21.
//

import SwiftUI

struct MyActionSheet: View {
    @State var sheetTurn = false

    var body: some View {
        Button(action: {sheetTurn = true}){
            Text("ActionSheet")
        }
        .actionSheet(isPresented: $sheetTurn){
            ActionSheet(
                title: Text("Title"),
                message: Text("Mssage"),
                buttons: myAlertBtn()
            )
        }
    }
}
func myAlertBtn() -> [Alert.Button]{
    var arrBtn = [Alert.Button]()
    for i in 0..<20{
        arrBtn.append(Alert.Button.default(Text("\(i)")))
    }
    arrBtn.append(.cancel())
    return arrBtn
}

struct MyActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        MyActionSheet()
    }
}
