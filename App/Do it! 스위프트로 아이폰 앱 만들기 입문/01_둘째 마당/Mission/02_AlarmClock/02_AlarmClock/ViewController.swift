//
//  ViewController.swift
//  02_AlarmClock
//
//  Created by Deforeturn on 11/8/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timePicker: UIDatePicker!
    @IBOutlet var cntLabel: UILabel! // 남은 시간 표시.
    var cntNumber = 0 // 남은 시간 계산.
    var timer: Timer?


    override func viewDidLoad() {
        super.viewDidLoad()
        cntLabel.text = "0"
    }
    
    @IBAction func goBtn(btn: UIButton){
        cntNumber = Int(timePicker.countDownDuration)
        cntLabel.text = String(cntNumber)
        timer?.invalidate() // 기존의 타이머가 있을 수도 있으니 초기화 먼저 함.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCntNumber), userInfo: nil, repeats: true)
        view.backgroundColor = UIColor.red
    }
    @objc func updateCntNumber(){
        if cntNumber == 0{ // 0일때 타이머 끝냄.
            timer?.invalidate()
            timer = nil
            view.backgroundColor = UIColor.white
        }else{
            cntNumber -= 1
        }
        cntLabel.text = String(cntNumber)
    }
}

