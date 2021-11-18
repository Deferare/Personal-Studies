//
//  ViewController.swift
//  01_MyTab
//
//  Created by Deforeturn on 11/18/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveToImage(_ btn:UIButton){
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnMoveToTime(_ btn:UIButton){
        tabBarController?.selectedIndex = 2
    }
}

