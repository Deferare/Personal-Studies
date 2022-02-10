//
//  ViewController.swift
//  MyAlamofire
//
//  Created by Deforeturn on 2/10/22.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet var downImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        requestExample()
    }
}

extension ViewController{
    
    func requestExample(){
        let url = "https://httpbin.org/image/png"

        AF.download(url).responseURL { response in
            self.downImageView.image = UIImage(contentsOfFile: response.fileURL!.path)
        }
    }
}

