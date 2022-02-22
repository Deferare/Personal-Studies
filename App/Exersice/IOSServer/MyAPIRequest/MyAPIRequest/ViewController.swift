//
//  ViewController.swift
//  MyAPIRequest
//
//  Created by Deforeturn on 2/17/22.
//
//- API Key
//LVhOyOBDZNz1kIInCJby7necC
//
//- API Key Secret
//8kIBUtxP7XnA8lj5k7nmvdu6dAAydywGFuRY0duZZkD2ajTDkQ


import UIKit
import OAuthSwift
import SafariServices


class ViewController: UIViewController {
    var oauthSwift:OAuthSwift?
//    var handle:OAuthSwiftRequestHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        self.test()
        self.test2()
    }
    
    func test(){
        oauthSwift = OAuth1Swift(consumerKey: "zaLqWt4BY5UWpfpMkpbA0skkv",
                                 consumerSecret: "KnisKRASciAnN7HDKMyAYSsrUri8iGRfGet6aJMvE2wiFmP4lz",
                                 requestTokenUrl: "https://api.twitter.com/oauth/request_token",
                                 authorizeUrl: "https://api.twitter.com/oauth/authorize",
                                 accessTokenUrl: "https://api.twitter.com/oauth/access_token")

        let handle = oauthSwift?.client.post("https://api.twitter.com/oauth/request_token?oauth_callback=://twissue") { result in
            do {
                print("result@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                print(result)

            } catch {
                print(error)
            }
            
        }
    }
    
    func test2(){
        let url = URL(string: "https://api.twitter.com/oauth/request_token?oauth_callback=twissue")
        var reqest = URLRequest(url: url!)
        reqest.httpMethod = "POST"
        URLSession.shared.dataTask(with: reqest){ data, res, err in
            print(res)
//            print(err)
        }.resume()
    }
}






