//
//  SecondViewController.swift
//  SignupScreenImplementation
//
//  Created by KANG SEUNG HOON on 2021/10/09.
//

import Foundation
import UIKit


class SecondViewController:UIViewController {
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var ageLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.nameLabel.text = Userinfomation.userShared.name
        self.ageLabel.text = Userinfomation.userShared.age
    }
    
    @IBAction func BackButton(){
        self.dismiss(animated: true, completion: nil)
    }
}
