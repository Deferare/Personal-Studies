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
import Accounts
import Social


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        SLServiceTypeTwitter.
        self.apiTest()
    }
}


extension ViewController{

    func apiTest(){
        var url = URL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        session.dataTask(with: request){ (data, res, err) in
            print(res)
        }.resume()
    }

      
    
    
}
