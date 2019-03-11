//
//  LockStatusViewController.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class LockStatusViewController: UIViewController {

    private var animatedUnlockView: AnimatedUnlockView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAnimatedUnlockView()
        startUnlockNotificationListener()
    }
    
    func configureAnimatedUnlockView() {
        animatedUnlockView = AnimatedUnlockView.instanceFromNib()
        view.addSubview(animatedUnlockView)
        
        animatedUnlockView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animatedUnlockView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animatedUnlockView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animatedUnlockView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            animatedUnlockView.heightAnchor.constraint(equalTo: animatedUnlockView.widthAnchor, multiplier: 540/450)
            ])
        
        animatedUnlockView.drawLock()
    }
    
    func startUnlockNotificationListener() {
        NotificationCenter.default.addObserver(forName: .successfulUnlockNotificationName, object: nil, queue: .main) { [weak self] (notification) in
            if notification.object is Int {
                self?.performUnlockAnimation()
            }
        }
    }
    
    func performUnlockAnimation() {
        animatedUnlockView.animateUnlock()
    }

}
