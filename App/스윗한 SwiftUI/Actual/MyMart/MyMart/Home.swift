//
//  ContentView.swift
//  MyMart
//
//  Created by Deforeturn on 12/7/21.
//

import SwiftUI

struct Home: View {
    let store: Store
    var body: some View {
        List(store.products) { product in
          ProductRow(product: product)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(store: Store())
    }
}
