//
//  MenuCell.swift
//  SettingsClone
//
//  Created by haewon on 2024/03/04.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
