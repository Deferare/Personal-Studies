//
//  ThirdViewController.swift
//  NotificationExample
//
//  Created by Deforeturn on 1/28/22.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var willBeHiddenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
            selector: #selector(hideLabel),
            name: NSNotification.Name(rawValue: "PostButton"),
            object: nil)
    }
    
    @objc func hideLabel(){
        if willBeHiddenLabel.layer.isHidden{
            willBeHiddenLabel.layer.isHidden = false
        }else{
            willBeHiddenLabel.layer.isHidden = true
        }
    }
}
