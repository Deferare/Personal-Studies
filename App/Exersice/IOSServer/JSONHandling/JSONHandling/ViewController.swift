//
//  ViewController.swift
//  JSONHandling
//
//  Created by Deforeturn on 2/21/22.
//

import UIKit

class ViewController: UIViewController {
    
//    let json = """
//    {
//        "name":"Def",
//        "age":26
//    }
//    """.data(using: .utf8)
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let def = User(name: "Def", age: 26)
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted
//
//        do{
//            let data = try encoder.encode(def)
//            print("Encoded: ", data)
//        }catch {
//            print(error.localizedDescription)
//        }
//
//
//
//        let decoder = JSONDecoder()
//        do{
//            let data = try decoder.decode(User.self, from: json!)
//            print("Decoded: ", data)
//        }catch {
//            print(error.localizedDescription)
//        }
        
        guard let url = URL(string: "https://randomuser.me/api/?results=2&inc=name,email,picture") else {return}
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, res, err in
            if let err = err {
                print("iflet-err: ", err)
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(Result.self, from: data!)
                print("result: ", result)
            } catch {
                print("err: ", err)
            }
        }.resume()
    }
}

//struct User:Codable{
//    var name:String
//    var age:Int
//}

struct Result:Codable{
    var results:[User]
}

struct User:Codable{
    struct Name:Codable {
        var title:String
        var first:String
        var last:String
    }
    
    struct Picture:Codable {
        var large:String
        var medium:String
        var thumbnail:String
    }
    var name:Name
    var email:String
    var picture:Picture
}
