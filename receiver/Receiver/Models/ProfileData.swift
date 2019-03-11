//
//  ProfileData.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import UIKit

/*
 
 Configurable datas for profile
 
 */

class ProfileData {
    
    var image: UIImage?
    var title: String
    var visibleChevron: Bool
    var titleColor: UIColor
    
    init(image: UIImage? = nil, title: String, visibleChevron: Bool = true, titleColor: UIColor = UIColor.black) {
        self.image = image
        self.title = title
        self.visibleChevron = visibleChevron
        self.titleColor = titleColor
    }
    
}
