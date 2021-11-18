//
//  EditViewController.swift
//  02_MyNavigation
//
//  Created by Deforeturn on 11/18/21.
//

import UIKit

protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    var textWayValue = ""
    var textMessage = ""
    var delegate: EditDelegate?
    var isOn = false
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var txMessege: UITextField!
    @IBOutlet var swichOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = textWayValue
        txMessege.text = textMessage
        swichOn.isOn = isOn
    }
    @IBAction func btnDone(_ btn: UIButton){
        if delegate != nil{
            delegate?.didMessageEditDone(self, message: txMessege.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)

        }
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func swichOnOff(_ swich: UISwitch){
        if swich.isOn{
            isOn = true
        }else{
            isOn = false
        }
    }
}
