//
//  Store.swift
//  MyMart
//
//  Created by Deforeturn on 12/9/21.
//


import Foundation

final class Store {
    
    var products: [Product]
  
    // MARK: Initialization
  
    init(filename: String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
