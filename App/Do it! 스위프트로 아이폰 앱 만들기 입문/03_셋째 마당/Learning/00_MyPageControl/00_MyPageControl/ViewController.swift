//
//  ViewController.swift
//  00_MyPageControl
//
//  Created by Deforeturn on 11/15/21.
//

import UIKit

class ViewController: UIViewController {
    var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainImageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageControl.numberOfPages = images.count
        mainImageControl.currentPage = 0
        mainImageControl.pageIndicatorTintColor = UIColor.green
        mainImageControl.currentPageIndicatorTintColor = UIColor.red
        mainImageView.image = UIImage(named: images[0])
    }


    @IBAction func mainPageChange(_ sender: UIPageControl) {
        mainImageView.image = UIImage(named: images[mainImageControl.currentPage])
    }
}

