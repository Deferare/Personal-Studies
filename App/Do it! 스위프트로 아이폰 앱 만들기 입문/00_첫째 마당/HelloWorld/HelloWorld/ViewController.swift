//
//  ViewController.swift
//  HelloWorld
//
//  Created by KANG SEUNG HOON on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ibHello: UILabel!
    @IBOutlet var ibText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        ibHello.text = ibText.text ?? "^^" + "Hi."
    }
    
}

