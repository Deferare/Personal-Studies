//
//  EditTitleCell.swift
//  Today
//
//  Created by Deforeturn on 2/4/22.
//

import UIKit

class EditTitleCell: UITableViewCell {
    @IBOutlet var titleTextField: UITextField!
    func configure(title: String) {
        titleTextField.text = title
    }
}
