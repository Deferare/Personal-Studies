//
//  ViewController.swift
//  NotificationExample
//
//  Created by Deforeturn on 1/28/22.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func postBtnTapped(_ sender: Any) {
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "PostButton"),
            object: nil)
    }
}
