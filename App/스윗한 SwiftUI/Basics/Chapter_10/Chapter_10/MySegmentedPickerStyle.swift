//
//  MySegmentedPickerStyle.swift
//  Chapter_10
//
//  Created by Deforeturn on 12/24/21.
//

import SwiftUI

struct MySegmentedPickerStyle: View {
    @State private var pickerSelecte = 1
    var body: some View {
        VStack{
            Picker("City", selection: $pickerSelecte){
                ForEach(1..<11){ i in
                    Text("\(i)").tag(i)
                }
            }
            .pickerStyle(.segmented)
            .padding()
        }
    }
}

struct MySegmentedPickerStyle_Previews: PreviewProvider {
    static var previews: some View {
        MySegmentedPickerStyle()
    }
}
