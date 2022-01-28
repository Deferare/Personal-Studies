//
//  ViewController.swift
//  AlertExample
//
//  Created by Deforeturn on 1/28/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func touchUpShowAlertButton(_ sender:UIButton){
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    @IBAction func touchUpShowActionSheetButton(_ sender:UIButton){
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }
    
    func showAlertController(style: UIAlertController.Style){
        let alertController = UIAlertController(title:"Title", message:"Message", preferredStyle: style)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action:UIAlertAction) in
             print("OK pressed")})
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        

        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addTextField{ (field) in
            field.placeholder = "name..."
            field.textColor = .cyan
        }
        self.present(alertController, animated: true, completion: {
            print("Alert controller shown")})
    }
}

