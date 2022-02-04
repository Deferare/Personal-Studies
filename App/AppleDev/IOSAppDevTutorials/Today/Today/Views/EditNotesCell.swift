//
//  EditNotesCell.swift
//  Today
//
//  Created by Deforeturn on 2/4/22.
//

import UIKit

class EditNotesCell: UITableViewCell {
    @IBOutlet var notesTextView: UITextView!

    func configure(notes: String?) {
        notesTextView.text = notes
    }
}
