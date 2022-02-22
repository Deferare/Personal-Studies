//
//  ViewController.swift
//  TwitterLogin
//
//  Created by Deforeturn on 2/22/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    @IBAction func loginBtn(_ sender:UIButton){
        print("BTN")
        var provider = OAuthProvider(providerID: "twitter.com")
        provider.customParameters = ["lang": "fr"]
              
        print(provider)
        provider.getCredentialWith(nil) { credential, error in
            if error != nil {
              // Handle error.
                print(error)
            }
            if credential != nil {
                Auth.auth().signIn(with: credential!) { authResult, error in
                    if error != nil {
                      // Handle error.
                        print(error)
                    }
                    print("Succes")
                    print(authResult?.credential)
                    // User is signed in.
                    // IdP data available in authResult.additionalUserInfo.profile.
                    // Twitter OAuth access token can also be retrieved by:
                    // authResult.credential.accessToken
                    // Twitter OAuth ID token can be retrieved by calling:
                    // authResult.credential.idToken
                    // Twitter OAuth secret can be retrieved by calling:
                    // authResult.credential.secret
                }
            }
        }
    }
    
}

