//
//  ViewController.swift
//  05_MyWeb
//
//  Created by Deforeturn on 11/11/21.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var webAdressField: UITextField!
    @IBOutlet var mainWebView: WKWebView!
    @IBOutlet var webIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        mainWebView.load(myRequest)
    }
    func checkUrl(_ url: String) -> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag{
            strUrl = "http://"+strUrl
        }
        return strUrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainWebView.navigationDelegate = self
        loadWebPage("http://www.google.com")
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        webIndicator.startAnimating()
        webIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webIndicator.stopAnimating()
        webIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        webIndicator.stopAnimating()
        webIndicator.isHidden = true
    }

    @IBAction func webGoBtn(_ sender: UIButton) {
        let myUrl = checkUrl(webAdressField.text!)
        webAdressField.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func site1Btn(_ sender: UIBarButtonItem) {
        loadWebPage("http://www.naver.com")
    }
    @IBAction func site2Btn(_ sender: UIBarButtonItem) {
        loadWebPage("http://www.netflix.com")
    }
    @IBAction func htmlBtn(_ sender: UIBarButtonItem) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        mainWebView.load(myRequest)
    }
    @IBAction func fileBtn(_ sender: UIBarButtonItem) {
    }
    @IBAction func myStopBtn(_ sender: UIBarButtonItem) {
        mainWebView.stopLoading()
    }
    @IBAction func myRefeshBtn(_ sender: UIBarButtonItem) {
        mainWebView.reload()
    }
    @IBAction func myRewindBtn(_ sender: UIBarButtonItem) {
        mainWebView.goBack()
    }
    @IBAction func myForwardBtn(_ sender: UIBarButtonItem) {
        mainWebView.goForward()
    }
}

