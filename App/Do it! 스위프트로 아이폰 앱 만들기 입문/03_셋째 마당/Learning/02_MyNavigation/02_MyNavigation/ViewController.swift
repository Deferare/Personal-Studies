//
//  ViewController.swift
//  02_MyNavigation
//
//  Created by Deforeturn on 11/18/21.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var isOn = true
    
    
    @IBOutlet var txMessege: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.image = imgOn
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue: use button"
            
        }else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue: use Bar button"
        }
        editViewController.textMessage = txMessege.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }

    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessege.text = message
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
        self.isOn = isOn
    }
}

