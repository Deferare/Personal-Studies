//
//  SecondViewController.swift
//  NotificationExample
//
//  Created by Deforeturn on 1/28/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var hiddenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(showLabel),
            name: NSNotification.Name(rawValue: "PostButton"),
            object: nil)
    }
    
    @objc func showLabel(){
        if hiddenLabel.layer.isHidden{
            hiddenLabel.layer.isHidden = false
        }else{
            hiddenLabel.layer.isHidden = true
        }
    }
}
