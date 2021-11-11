//
//  ViewController.swift
//  05_MyWeb
//
//  Created by Deforeturn on 11/11/21.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet var mainWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        mainWebView.load(myRequest)
    }
}

