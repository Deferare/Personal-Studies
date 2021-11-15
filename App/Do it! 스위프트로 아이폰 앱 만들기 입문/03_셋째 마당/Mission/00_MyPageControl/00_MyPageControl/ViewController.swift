//
//  ViewController.swift
//  00_MyPageControl
//
//  Created by Deforeturn on 11/15/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var mainPageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainPageControl.pageIndicatorTintColor = UIColor.lightGray
        mainPageControl.currentPageIndicatorTintColor = UIColor.black
        mainPageControl.numberOfPages = 100
        mainPageControl.currentPage = 0
        mainLabel.text = "0"
    }


    @IBAction func mainPageChange(_ sender: UIPageControl) {
        mainLabel.text = String(mainPageControl.currentPage)
    }
}

