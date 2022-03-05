//
//  ViewController.swift
//  TwitterLogin
//
//  Created by Deforeturn on 2/22/22.
//

import UIKit
import OAuthSwift

class ViewController: UIViewController {
    var oauthswift: OAuth1Swift!
    var newOAuthToken: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.oauthswift = OAuth1Swift(
            consumerKey:    "zaLqWt4BY5UWpfpMkpbA0skkv",
            consumerSecret: "KnisKRASciAnN7HDKMyAYSsrUri8iGRfGet6aJMvE2wiFmP4lz",
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl:    "https://api.twitter.com/oauth/authorize",
            accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
        )
//        self.oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)
        oauthswift.authorize(
            withCallbackURL: "twissueapp://") { result in
            switch result {
            case .success(let (credential, response, parameters)):
                print(credential.oauthToken)
                print(credential.oauthTokenSecret)
                print(parameters["user_id"])
                // Do your request

            case .failure(let error):
              print(error.localizedDescription)
            }
        }
    }
    

    @IBAction func loginBtn(_ sender:UIButton){
        print("BTN")


        oauthswift.client.request("https://api.twitter.com/2/tweets/1497855318713257987", method: .GET) {res in
            switch res {
            case .success(let response):
                print(response.string)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
    }
    
}

