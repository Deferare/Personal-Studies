//
//  ViewController.swift
//  07_MyPinchGesture
//
//  Created by Deforeturn on 11/29/21.
//

import UIKit

class ViewController: UIViewController {
    var number = 0
    var initialFontSize:CGFloat!
    
    @IBOutlet var lbPinch: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }

    @objc func doPinch(_ pinch:UIPinchGestureRecognizer){
        number += 1
        print(number)
        if pinch.state == UIGestureRecognizer.State.began{
            initialFontSize = lbPinch.font.pointSize
        }else{
            lbPinch.font = lbPinch.font.withSize(initialFontSize * pinch.scale)
        }
    }
}

