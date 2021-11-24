//
//  SecondViewController.swift
//  00_MyCaculator
//
//  Created by Deforeturn on 11/24/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    var receiveStr = ""
    var delegate:SecondSendDelegate?
    
    @IBOutlet var lblView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblView.text = receiveStr
    }
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.txtRespone("Testwesrfersfs!!!!!!!!!!!@!")
    }
}



protocol SecondSendDelegate{
    func txtSend(_ controller: SecondViewController, _ str:String)
    func txtRespone(_ str:String)
}
