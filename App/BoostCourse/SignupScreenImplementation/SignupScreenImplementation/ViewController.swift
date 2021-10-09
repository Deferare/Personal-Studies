//
//  ViewController.swift
//  SignupScreenImplementation
//
//  Created by KANG SEUNG HOON on 2021/10/04.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var nameText:UITextField!
    @IBOutlet var ageText:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
    }
    
    @IBAction func userSet(){
        Userinfomation.userShared.name = nameText.text
        Userinfomation.userShared.age = ageText.text
    }
}

