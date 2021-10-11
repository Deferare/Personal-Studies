//
//  ViewController2.swift
//  SignupScreenImplementation
//
//  Created by KANG SEUNG HOON on 2021/10/11.
//



import UIKit

class ViewController2:UIViewController, UIGestureRecognizerDelegate{
    @IBOutlet var textF:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.delegate = self
        self.view.addGestureRecognizer(tapRecognizer)
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UIEvent) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
