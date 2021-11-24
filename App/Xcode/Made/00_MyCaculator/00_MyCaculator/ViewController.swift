//
//  ViewController.swift
//  00_MyCaculator
//
//  Created by Deforeturn on 11/24/21.
//

import UIKit

class ViewController: UIViewController, SecondSendDelegate {
    

    @IBOutlet var txtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtField.text = ""
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! SecondViewController
        txtSend(secondViewController, txtField.text!)
        secondViewController.delegate = self
    }
    @IBAction func btnSend(_ sender: UIButton) {
    }
    
    func txtSend(_ controller: SecondViewController, _ str: String) {
        controller.receiveStr = str
    }
    func txtRespone(_ str: String) {
        txtField.text = str
    }
}

