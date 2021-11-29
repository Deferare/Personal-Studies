//
//  ViewController.swift
//  04_MyTapTouch
//
//  Created by Deforeturn on 11/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lbMessage: UILabel!
    @IBOutlet var lbTapCount: UILabel!
    @IBOutlet var lbTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lbMessage.text = "Touchs Began"
        lbTapCount.text = String(touch.tapCount)
        lbTouchCount.text = String(touches.count)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lbMessage.text = "Touchs Moved"
        lbTapCount.text = String(touch.tapCount)
        lbTouchCount.text = String(touches.count)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lbMessage.text = "Touchs Ended"
        lbTapCount.text = String(touch.tapCount)
        lbTouchCount.text = String(touches.count)
    }
}

