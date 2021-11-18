//
//  ViewController.swift
//  02_MyNavigation
//
//  Created by Deforeturn on 11/18/21.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    var lampStatus = "lamp_on.png"
    
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = UIImage(named: lampStatus)
        stateLabel.text = lampStatus
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewC = segue.destination as! EditViewController
        if lampStatus == "lamp_on.png"{
            editViewC.swichStatus = true
        }else{
            editViewC.swichStatus = false
        }
        editViewC.delegate = self
    }
    @IBAction func imageTouch(_ sender: UIButton){
        if lampStatus == "lamp_on.png"{
            lampStatus = "lamp_off.png"
            mainImageView.image = UIImage(named: lampStatus)
        }else{
            lampStatus = "lamp_on.png"
            mainImageView.image = UIImage(named: lampStatus)
        }
        stateLabel.text = lampStatus
    }
    
    func DoneSwichOnOff(_ editViewController: EditViewController, _ swich: UISwitch) {
        if swich.isOn{
            self.lampStatus = "lamp_on.png"
            self.mainImageView.image = UIImage(named: self.lampStatus)
        }else{
            self.lampStatus = "lamp_off.png"
            self.mainImageView.image = UIImage(named: self.lampStatus)
        }
        self.stateLabel.text = self.lampStatus
    }
}

