//
//  ViewController.swift
//  JSONHandling
//
//  Created by Deforeturn on 2/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    let json = """
    {
        "name":"Def",
        "age":26
    }
    """.data(using: .utf8)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let def = User(name: "Def", age: 26)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do{
            let data = try encoder.encode(def)
            print(String(data: data, encoding: .utf8))
        }catch {
            print(error.localizedDescription)
        }
        
        let decoder = JSONDecoder()
        do{
            let data = try decoder.decode(User.self, from: json!)
            print(data)
            print(data.age)
        }catch {
            print(error.localizedDescription)
        }
    }
}

struct User:Codable{
    var name:String
    var age:Int
}

