//
//  AnimatedUnlockView.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/10/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

/*
 
 This animated view won't work on blurred / transparent backgrounds, since it
 requires colored background for some transparency manipulations
 
 */

class AnimatedUnlockView: BaseView {
    
    @IBOutlet weak var topArcView: UIView!
    @IBOutlet weak var bigRoundView: UIView!
    @IBOutlet weak var smallRoundView: UIView!
    @IBOutlet weak var toggleOvalView: UIView!
    @IBOutlet weak var toggleOvalViewLeadingConstraint: NSLayoutConstraint!
    
    private var animationPerformed: Bool = false
    private lazy var toggleOvalShape = CAShapeLayer()
    private let lineWidth: CGFloat = 3.5
    
    func drawLock() {
        // perform resize to real sizes first
        setNeedsLayout()
        layoutIfNeeded()
        
        toggleOvalViewLeadingConstraint.constant = -smallRoundView.frame.height / 2
        
        backgroundColor = superview?.backgroundColor
        
        // configure dynamic top arc part of the lock
        let leftArcOffset = frame.width * 0.15
        let arcHeight = bigRoundView.frame.minY
        let arcWidth: CGFloat = frame.width / 7
        
        let arcPath = UIBezierPath(arcCenter: CGPoint(x: frame.width / 2, y: arcHeight), radius: frame.width / 2 - leftArcOffset, startAngle: .pi, endAngle: 0, clockwise: true)
        arcPath.addLine(to: CGPoint(x: arcPath.currentPoint.x - arcWidth, y: arcPath.currentPoint.y))
        arcPath.addArc(withCenter: CGPoint(x: frame.width / 2, y: arcHeight), radius: frame.width / 2 - leftArcOffset - arcWidth, startAngle: 0, endAngle: .pi, clockwise: false)
        arcPath.close()
        
        var topArcShape = CAShapeLayer()
        topArcShape.path = arcPath.cgPath
        configureShapeWithDefaultStyle(&topArcShape)
        topArcView.layer.addSublayer(topArcShape) // add to separate view, so we can easy animate it later
        
        // configure static oval parts of the lock
        let ovalPath = UIBezierPath(roundedRect: bigRoundView.bounds, cornerRadius: 10)
        let centerOvalPath = UIBezierPath(roundedRect: smallRoundView.frame, cornerRadius: smallRoundView.frame.height / 2)
        ovalPath.append(centerOvalPath)
        
        var ovalShapeLayer = CAShapeLayer()
        ovalShapeLayer.path = ovalPath.cgPath
        configureShapeWithDefaultStyle(&ovalShapeLayer)
        bigRoundView.layer.addSublayer(ovalShapeLayer)
        bigRoundView.bringSubviewToFront(smallRoundView)
        
        // configure dynamic round part in the middle of the lock
        let centerRoundPath = UIBezierPath(ovalIn: toggleOvalView.bounds)
        
        toggleOvalShape.path = centerRoundPath.cgPath
        configureShapeWithDefaultStyle(&toggleOvalShape)
        toggleOvalView.layer.addSublayer(toggleOvalShape) // add to separate view, so we can easy animate it later
    }
    
    func configureShapeWithDefaultStyle( _ shapeLayer: inout CAShapeLayer) {
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = backgroundColor?.cgColor
        shapeLayer.lineWidth = lineWidth
    }
    
    func animateUnlock() {
        // make sure animation starts only once
        if animationPerformed {
            return
        }
        
        animationPerformed = true
        
        performCycledAnimation()
    }
    
    private func performCycledAnimation() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
            if let self = self {
                // move toggle to right
                self.toggleOvalView.transform = CGAffineTransform(translationX: self.toggleOvalView.frame.width + self.smallRoundView.frame.height / 2 + self.lineWidth, y: 0)
            }
        }) { [weak self] (_) in
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                // return toggle to inital position
                self?.toggleOvalView.transform = CGAffineTransform.identity
            }, completion: nil)
        }
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
            // perform top arc unlock
            self?.topArcView.transform = CGAffineTransform(rotationAngle: .pi / 4)
            
            // make toggle "on"
            self?.toggleOvalShape.fillColor = UIColor.white.cgColor
        }) { [weak self] (_) in
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeLinear, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                    // perform top arc lock
                    self?.topArcView.transform = .identity
                    
                    // make toggle "off"
                    self?.toggleOvalShape.fillColor = self?.backgroundColor?.cgColor
                })
            }) { (_) in
                // cycle unlock animation
                self?.performCycledAnimation()
            }
        }
    }

}
