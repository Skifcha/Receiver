//
//  UIViewControllerExtension.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // get the very top controller, check for presented as well
    static var topViewController: UIViewController? {
        guard var topController = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }
        
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        
        return topController
    }
    
    // show alert helpers
    func showAlert(title: String? = "Error", message: String?, okButtonTitle: String? = "Ok") {
        showAlert(title: title, message: message, actions: [UIAlertAction(title: okButtonTitle, style: .default, handler: { (_) in })])
    }
    
    func showAlert(title: String?, message: String?, actions: [UIAlertAction]) {
        // some alert already've been presented, just skip the current one
        if UIViewController.topViewController is UIAlertController {
            return
        }
        
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in actions {
            alertView.addAction(action)
        }
        
        present(alertView, animated: true, completion: nil)
    }
    
}
