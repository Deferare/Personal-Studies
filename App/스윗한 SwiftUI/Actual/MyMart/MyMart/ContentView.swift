//
//  ContentView.swift
//  MyMart
//
//  Created by Deforeturn on 12/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ProductRow(product: productSamples[0])
            ProductRow(product: productSamples[1])
            ProductRow(product: productSamples[2])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
