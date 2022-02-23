//
//  ViewController.swift
//  TwitterLogin
//
//  Created by Deforeturn on 2/22/22.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController, AuthUIDelegate {
    let provider = OAuthProvider(providerID: "twitter.com")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
    }
    

    @IBAction func loginBtn(_ sender:UIButton){
        print("BTN")

        
        provider.getCredentialWith(nil) { credent, err in
            print(err)

        }
            
              

        
    }
    
}

