//
//  UIColorExtension.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
        assert(r >= 0 && r <= 255, "Invalid red")
        assert(g >= 0 && g <= 255, "Invalid green")
        assert(b >= 0 && b <= 255, "Invalid blue")
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
    
}
