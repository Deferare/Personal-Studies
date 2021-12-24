//
//  MyWheelPickerStyle.swift
//  Chapter_10
//
//  Created by Deforeturn on 12/24/21.
//

import SwiftUI

struct MyWheelPickerStyle: View {
    @State private var selection = 2
    var body: some View {
        Picker("Reserved Number", selection: $selection){
            ForEach(1..<15){ i in
                HStack{
                    Image(systemName: "person.fill")
                    Text("\(i) person")
                }.tag(i)
            }
        }
        .pickerStyle(.wheel)
        .background(RoundedRectangle(cornerRadius: 12).stroke(.blue, lineWidth: 1))
        .labelsHidden()
        .padding()
            
    }
}

struct MyWheelPickerStyle_Previews: PreviewProvider {
    static var previews: some View {
        MyWheelPickerStyle()
    }
}
