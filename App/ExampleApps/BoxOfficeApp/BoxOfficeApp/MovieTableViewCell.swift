//
//  MovieTableViewCell.swift
//  BoxOfficeApp
//
//  Created by Deforeturn on 1/31/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet var movieLabel:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
