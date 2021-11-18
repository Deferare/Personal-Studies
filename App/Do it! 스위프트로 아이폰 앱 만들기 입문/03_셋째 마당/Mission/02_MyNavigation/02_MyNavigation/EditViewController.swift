//
//  EditViewController.swift
//  02_MyNavigation
//
//  Created by Deforeturn on 11/18/21.
//

import UIKit

class EditViewController: UIViewController {
    var swichStatus = true
    var delegate: EditDelegate?
    
    @IBOutlet var lampSwich: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lampSwich.isOn = swichStatus
    }
    override func viewWillDisappear(_ animated: Bool) {
        if delegate != nil{
            delegate?.DoneSwichOnOff(self, lampSwich)
        }
    }
    @IBAction func swichOnOff(_ sender: UISwitch){
        lampSwich.isOn = sender.isOn
    }
}


protocol EditDelegate{
    func DoneSwichOnOff(_ editViewController: EditViewController, _ swich: UISwitch)
}
