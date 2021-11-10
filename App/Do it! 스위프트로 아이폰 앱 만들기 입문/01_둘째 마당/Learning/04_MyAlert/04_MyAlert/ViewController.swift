//
//  ViewController.swift
//  04_Alert
//
//  Created by Deforeturn on 11/10/21.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    var isLampOn = true
    
    @IBOutlet var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView.image = imgOn
    }


    @IBAction func onBtn(_ sender: UIButton) {
        if isLampOn{
            let lampOnAlert = UIAlertController(title: "Warning", message: "It's currently on.", preferredStyle: UIAlertController.Style.alert)
            let lampOnAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(lampOnAction)
            present(lampOnAlert, animated: true, completion: nil)
            
        }else{
            myImageView.image = imgOn
            isLampOn = true
        }
    }
    @IBAction func offBtn(_ sender: UIButton) {
        if isLampOn{
            let lampOffAlert = UIAlertController(title: "Order", message: "Do you want to turn off the light?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {
                ACTION in self.myImageView.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    @IBAction func removeBtn(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "Lamp Remove", message: "Do you want to remove the Lamp?" , preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "No, turn off", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.myImageView.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "No, turn on", style: UIAlertAction.Style.default, handler: {
            _ in
            self.myImageView.image = self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "Yes remove", style: UIAlertAction.Style.default, handler: {
            _ in
            self.myImageView.image = self.imgRemove
            self.isLampOn = false
        })
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

