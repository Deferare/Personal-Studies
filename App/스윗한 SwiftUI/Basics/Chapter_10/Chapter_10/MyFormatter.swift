//
//  MyFormatter.swift
//  Chapter_10
//
//  Created by Deforeturn on 12/24/21.
//

import SwiftUI

struct MyFormatter: View {
    @State private var myDate = ""
    var body: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.DD"
        return Form{
            TextField("Place Hold", value: $myDate, formatter: dateFormatter)
        }
    }
}

struct MyFormatter_Previews: PreviewProvider {
    static var previews: some View {
        MyFormatter()
    }
}
