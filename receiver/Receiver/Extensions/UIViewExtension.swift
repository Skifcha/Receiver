//
//  UIViewExtension.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import UIKit

protocol UIViewLoading {}
extension UIView: UIViewLoading {}

extension UIViewLoading where Self: UIView {
    
    // init view directly from Nib helper
    static func instanceFromNib() -> Self {
        return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as! Self
    }
    
}
