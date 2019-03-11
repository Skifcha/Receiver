//
//  SplashView.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/10/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class SplashView: BaseView {
    
    override func initInternal() {
        backgroundColor = UIColor(r: 35, g: 167, b: 253, a: 1)
    }
    
    func show() {
        // get current app window and add splash to it
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window else {
            return
        }
        
        window.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: window.leadingAnchor),
            trailingAnchor.constraint(equalTo: window.trailingAnchor),
            topAnchor.constraint(equalTo: window.topAnchor),
            bottomAnchor.constraint(equalTo: window.bottomAnchor)
            ])
        
        // show it just 5 secs
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { [weak self] (timer) in
            self?.hide()
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.alpha = 0.0
        }) { [weak self] (_) in
            self?.removeFromSuperview()
        }
    }

}
