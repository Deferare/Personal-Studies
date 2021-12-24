//
//  MyFormAndPicker.swift
//  Chapter_10
//
//  Created by Deforeturn on 12/24/21.
//

import SwiftUI

struct MyFormAndPicker: View {
    @State private var autoLock = "1 Minute"
    private let autoLockOption = ["30 Seconds", "1 Minute", "2 Minute", "5 Minute", "Never"]
    var body: some View {
        NavigationView{
            Form{
                Picker("Auto Lock", selection: $autoLock){
                    ForEach(autoLockOption, id:\.self){
                        Text($0).tag($0)
                    }
                }
                .pickerStyle(.automatic)
            }
        }
    }
}

struct MyFormAndPicker_Previews: PreviewProvider {
    static var previews: some View {
        MyFormAndPicker()
    }
}
