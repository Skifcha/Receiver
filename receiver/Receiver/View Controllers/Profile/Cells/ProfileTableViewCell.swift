//
//  ProfileTableViewCell.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chevronImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var profileData: ProfileData! {
        didSet {
            iconImageView.image = profileData.image
            iconImageView.isHidden = profileData.image == nil
            titleLabel.text = profileData.title
            titleLabel.textColor = profileData.titleColor
            chevronImageView.isHidden = !profileData.visibleChevron
        }
    }
    
    var isLastCell: Bool = false {
        didSet {
            separatorInset.left = isLastCell ? 0.0 : 15.0
        }
    }

}
