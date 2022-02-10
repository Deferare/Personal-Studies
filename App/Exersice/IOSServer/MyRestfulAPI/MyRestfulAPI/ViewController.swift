//
//  ViewController.swift
//  MyRestfulAPI
//
//  Created by Deforeturn on 2/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var id:UITextField!
    @IBOutlet var name:UITextField!
    @IBOutlet var reusultView:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        apiCall()
    }
}

extension ViewController{
    func apiCall(){
        do {
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
//            let response = try String(contentsOf: url!)
            let response = try NSString(contentsOf: url!, encoding: String.Encoding.utf8.rawValue)
            print("response: ", response)
        } catch let error as NSError{
            print("Err: ", error.localizedDescription)
        }
    }
    
    
    @IBAction func postBtnAction(_ sender:UIButton){
        
        let bodyParam = "userId=\(self.id.text!)&name=\(self.name.text!)"
        let body = bodyParam.data(using: .utf8)
        
        // Object definition.
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
        var req = URLRequest(url: url!)
        
        // REQ - Line set.
        req.httpMethod = "POST"
        
        // REQ - Header set.
        req.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        req.setValue(String(body!.count), forHTTPHeaderField: "Content-Length")
        
        // REQ - Body set.
        req.httpBody = body
        
        // Respone to Server.
        URLSession.shared.dataTask(with: req) {(data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObj = json else {return}
                    
                    let result = jsonObj["result"] as? String
                    let id = jsonObj["userId"] as? String
                    let name = jsonObj["name"] as? String
                    if result == "SUCCESS" {
                        self.reusultView.text = result! + "\n" + id! + "\n" + name!
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

