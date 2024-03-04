//
//  ProfileCell.swift
//  SettingsClone
//
//  Created by haewon on 2024/02/04.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // 시작부분
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = 30 // 60 / 2
        
        titleLabel.textColor = .blue
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        
        descriptionLabel.textColor = .darkGray
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
