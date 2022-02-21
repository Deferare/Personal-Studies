//
//  ViewController.swift
//  MyRestfulAPI
//
//  Created by Deforeturn on 2/10/22.
//

import Foundation
import UIKit
import Alamofire

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let param = ["oauth_callback":TF().OauthCallback]
                     
        
        let url = URL(string: "https://api.twitter.com/oauth/request_token")
        let req = AF.request(url!, method: .post, parameters: param, encoding: JSONEncoding.default)
        req.responseJSON {res in
            print(res.data!)
            
        }
    }
}


