//
//  ViewController.swift
//  04_MyAlertClock
//
//  Created by Deforeturn on 11/10/21.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var myDatePicker: UIDatePicker!
    @IBOutlet var mySetTime: UILabel!
    @IBOutlet var myCrntTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeUpdate), userInfo: "1", repeats: true)
        // Do any additional setup after loading the view.
    }


    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss aaa"
        mySetTime.text = formatter.string(from:sender.date)
    }
    
    @objc func timeUpdate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss aaa"
        myCrntTime.text = formatter.string(from: Date.now)
        if myCrntTime.text == mySetTime.text {
            let myAlert = UIAlertController(title: "Alert", message: "Time's Up", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                _ in
                self.mySetTime.text = ""
            })
            myAlert.addAction(alertAction)
            present(myAlert, animated: true, completion: nil)
        }
    }
}

