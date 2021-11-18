//
//  ViewController.swift
//  DatePicker
//
//  Created by KANG SEUNG HOON on 2021/11/05.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    
    @IBOutlet var crntTime: UILabel!
    @IBOutlet var selectTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }


    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        selectTime.text = "Select Time : "+formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
//        crntTime.text = String(count)
//        count += 1
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        crntTime.text = "Crnt Time : "+formatter.string(from: date as Date)
    }
}

