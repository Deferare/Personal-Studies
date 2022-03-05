//
//  ViewController.swift
//  MyFirebaseDBExample
//
//  Created by Deforeturn on 3/5/22.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    @IBOutlet var textField:UITextField!
    
    var ref: DatabaseReference!
    var refHandle:Any!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ref = Database.database().reference()
        refHandle = ref.observe(DataEventType.value) { snapshot in
            print(snapshot)
        }
    }
    
    
    @IBAction func fildBtn(_ sender:UIButton){
        self.ref.child("Test1").setValue(["name":self.textField.text])
        
//        self.ref.child("Test1").child("name").getData() { error, snapshot in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return
//            }
//            let userName = snapshot.value as? String ?? "Unknown"
//            print(userName)
//        }
    }
}

