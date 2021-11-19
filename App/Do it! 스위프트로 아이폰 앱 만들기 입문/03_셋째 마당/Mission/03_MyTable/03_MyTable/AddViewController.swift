//
//  AddViewController.swift
//  03_MyTable
//
//  Created by Deforeturn on 11/19/21.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pkIndex = 0
    
    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var pkView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddBtn(_ sender:UIButton){
        items.append(tfAddItem.text!)
        itemImageFile.append(itemImageFile[pkIndex])
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - PickerViewFunc
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return CGFloat(100)
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemImageFile.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = UIImageView(image: UIImage(named: itemImageFile[row]))
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return image
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pkIndex = row
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
