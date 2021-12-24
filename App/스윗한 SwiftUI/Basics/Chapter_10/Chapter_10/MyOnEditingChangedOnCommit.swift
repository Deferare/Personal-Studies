//
//  MyOnEditingChangedOnCommit.swift
//  Chapter_10
//
//  Created by Deforeturn on 12/24/21.
//

import SwiftUI

struct MyOnEditingChangedOnCommit: View {
    @State private var name = ""
    @State private var age = ""
    @State private var nameCheck = false
    @State private var ageCheck = false
    @State private var btnName = "등록 하기"
    
    @State private var name2 = ""
    @State private var nameCheck2 = false
    @State private var btnName2 = "등록 하기"
    var body: some View {
        Form{
            HStack{
                TextField("Name", text: $name, onEditingChanged: { edit in
                    if !edit{
                        self.name = self.name.trimmingCharacters(in: .whitespaces)
                        if self.name.count > 0{
                            nameCheck = true
                        }
                    }
                }).overlay(validationCheckImage(valid: nameCheck), alignment: .trailing)
            }
            HStack{
                TextField("Age", text: $age, onEditingChanged: {edit in
                    if !edit{
                        self.age = self.age.trimmingCharacters(in: .whitespaces)
                        if self.age.count > 0{
                            ageCheck = true
                        }
                    }
                }).overlay(validationCheckImage(valid: ageCheck), alignment: .trailing)
            }
            if nameCheck && ageCheck{
                Button(action: {btnName = "등록 완료"}){
                    Text(btnName)
                }
            }
            Section{
                TextField("Test", text: $name2, onCommit: {
                    self.name2 = self.name2.trimmingCharacters(in: .whitespaces)
                    if self.name2.count > 0{
                        self.nameCheck2 = true
                    }
                }).overlay(validationCheckImage(valid: nameCheck2), alignment: .trailing)
                if self.nameCheck2{
                    Button(btnName2){
                        self.btnName2 = "등록 완료"
                    }
                }
            }
        }
    }
    
    func validationCheckImage(valid:Bool) -> some View{
        Image(systemName: valid ? "checkmark":"")
    }
}

struct MyOnEditingChangedOnCommit_Previews: PreviewProvider {
    static var previews: some View {
        MyOnEditingChangedOnCommit()
    }
}
