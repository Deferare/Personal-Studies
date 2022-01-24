//
//  ViewController.swift
//  AsyncExample
//
//  Created by Deforeturn on 1/24/22.
//

import UIKit

class ViewController: UIViewController {

    var cnt = 0
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var cntLabel:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func downBtn(_ sender:UIButton){
        let imagePath = "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg"
        let imageURL:URL = URL(string: imagePath)!

        
        OperationQueue().addOperation{
            let imageData:Data = try! Data(contentsOf: imageURL)
            let image = UIImage(data: imageData)
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
        }
    }
    
    @IBAction func imageBtn(_ sender:UIButton){
        self.cnt += 1
        self.cntLabel.text = "\(cnt)"
    }
}

