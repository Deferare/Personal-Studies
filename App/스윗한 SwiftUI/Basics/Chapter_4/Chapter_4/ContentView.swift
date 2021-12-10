//
//  ContentView.swift
//  Chapter_4
//
//  Created by Deforeturn on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        ForEach(["iPhone Xs", "iPhone 11 Pro", "iPhone 12 Pro", "iPhone 13 Pro"], id:\.self){deName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deName))
                .previewDisplayName(deName)
                .previewLayout(.fixed(width: 100, height: 100))
        }
    
    }
}
