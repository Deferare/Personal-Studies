//
//  CustomTableViewCell.swift
//  Weather
//
//  Created by Deforeturn on 1/22/22.
//

import UIKit

class CountrieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCell:UIImageView!
    @IBOutlet weak var labelCell:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCell:UIImageView!
    @IBOutlet weak var nameCell:UILabel!
    @IBOutlet weak var SCCell:UILabel!
    @IBOutlet weak var rainfallProbability:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
