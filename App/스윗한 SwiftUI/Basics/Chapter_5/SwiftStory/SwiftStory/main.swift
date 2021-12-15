//
//  main.swift
//  SwiftStory
//
//  Created by Deforeturn on 12/15/21.
//

import Foundation

@propertyWrapper
struct RoundedToTwo{
    var value:Int = 0
    var wrappedValue: Int{
        get {value}
        set {value = multif(n: newValue)}
    }
    
    func multif(n:Int) -> Int{
        return n*n
    }
}

struct Number{
    @RoundedToTwo var num:Int
}

var number = Number()
print(number.num)
number.num = 2
print(number.num)
