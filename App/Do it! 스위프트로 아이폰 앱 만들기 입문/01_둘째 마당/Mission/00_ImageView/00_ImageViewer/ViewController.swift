//
//  ViewController.swift
//  00_ImageViewer
//
//  Created by Deforeturn on 11/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIImageView!
    var imageSetNumber = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.image = UIImage(named: "\(imageSetNumber).png")
    }
    @IBAction func preBtn(_ sender: UIButton) {
        if imageSetNumber > 1{
            imageSetNumber -= 1
        }
        mainView.image = UIImage(named: "\(imageSetNumber).png")
    }
    @IBAction func nextBtn(_ sender: UIButton) {
        if imageSetNumber < 6{
            imageSetNumber += 1
        }
        mainView.image = UIImage(named: "\(imageSetNumber).png")
    }
}

