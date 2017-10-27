//
//  UIViewExtensions.swift
//  Umzugscoach
//
//  Created by Alex on 25.10.17.
//  Copyright © 2017 Oleksandr Vashchenko. All rights reserved.
// UIButtonExtensions

import UIKit

enum Screens {
    case lastAddress
    case listScreen
}

extension UIView {
    
    func showWithDamping(duration: Double, delay: Double) {
        
        layer.anchorPoint.y = 1.0
        transform = CGAffineTransform(scaleX: 1.0, y: 1.5)
        layer.anchorPoint.y = 1
        UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 0.2, initialSpringVelocity: 8.0, options: [] , animations: {
            self.transform = .identity
        }, completion: nil)
    }
    
    func show() {
        alpha = 1
    }
    
    func hide() {
        alpha = 0
    }
}
