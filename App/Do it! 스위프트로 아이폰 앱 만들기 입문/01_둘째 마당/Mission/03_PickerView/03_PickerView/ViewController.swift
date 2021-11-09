//
//  ViewController.swift
//  03_PickerView
//
//  Created by Deforeturn on 11/9/21.
//

import UIKit
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var myPickerView: UIPickerView!
    @IBOutlet var imageLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    var images = [UIImage?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1..<11{
            let image = UIImage(named: String(i)+".jpg")
            images.append(image)
        }
        imageLabel.text = "1.jpg"
        myImageView.image = images[0]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 250
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = UIImageView(image: images[row])
        image.frame = CGRect(x:0,y:0,width:150,height:150)
        return image
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myImageView.image = images[row]
        imageLabel.text = "\(row)"
    }
}

