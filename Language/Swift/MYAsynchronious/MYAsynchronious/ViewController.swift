//
//  ViewController.swift
//  MYAsynchronious
//
//  Created by Deforeturn on 3/15/22.
//

import UIKit

class ViewController: UIViewController {

    var arr = [1,100]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.myStart()
        

        
    }
    
    func myPrint(){
        
        for i in 0..<10 {
            print("myPrint: ", i)
        }
    }
    
    func myStart(){
        Timer.scheduledTimer(withTimeInterval: -1, repeats: true){t1 in
            Timer.scheduledTimer(withTimeInterval: -1, repeats: true){t2 in
                print(self.arr)
                self.myPrint()
            }
        }
    }

}

