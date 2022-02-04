//
//  EditDateCell.swift
//  Today
//
//  Created by Deforeturn on 2/4/22.
//

import UIKit

class EditDateCell: UITableViewCell {

    @IBOutlet var datePicker: UIDatePicker!
    
    func configure(date: Date) {
        datePicker.date = date
    }
    
}
