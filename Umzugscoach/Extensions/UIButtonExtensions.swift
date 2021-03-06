//
//  UIButtonExtensions.swift
//  Umzugscoach
//
//  Created by Alex on 25.10.17.
//  Copyright © 2017 Oleksandr Vashchenko. All rights reserved.
//

import UIKit

extension UIButton {
    
    func addBorderWithColor(_ color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 2.0
    }
    
    func addCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func moveUP(superView: UIView) {
        CATransaction.begin()
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: superView.frame.width/2, y: superView.frame.height + 60)
        animation.toValue = CGPoint(x: superView.frame.width/2, y: superView.frame.height)
        animation.duration = 0.5
        layer.add(animation, forKey: "position")
        CATransaction.commit()
    }
    
    @discardableResult
    func applyGradientWith(startColor: UIColor, endColor: UIColor) -> Bool {
        
        var startColorRed:CGFloat = 0
        var startColorGreen:CGFloat = 0
        var startColorBlue:CGFloat = 0
        var startAlpha:CGFloat = 0
        
        if !startColor.getRed(&startColorRed, green: &startColorGreen, blue: &startColorBlue, alpha: &startAlpha) {
            return false
        }
        
        var endColorRed:CGFloat = 0
        var endColorGreen:CGFloat = 0
        var endColorBlue:CGFloat = 0
        var endAlpha:CGFloat = 0
        
        if !endColor.getRed(&endColorRed, green: &endColorGreen, blue: &endColorBlue, alpha: &endAlpha) {
            return false
        }
        
        let gradientText = self.titleLabel?.text ?? ""
        
        let name:String = NSFontAttributeName
        let textSize: CGSize = gradientText.size(attributes: [name:self.titleLabel?.font ?? UIFont.systemFont(ofSize: 14)])
        let width:CGFloat = textSize.width
        let height:CGFloat = textSize.height
        
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return false
        }
        
        UIGraphicsPushContext(context)
        
        let glossGradient:CGGradient?
        let rgbColorspace:CGColorSpace?
        let num_locations:size_t = 2
        let locations:[CGFloat] = [ 0.0, 1.0 ]
        let components:[CGFloat] = [startColorRed, startColorGreen, startColorBlue, startAlpha, endColorRed, endColorGreen, endColorBlue, endAlpha]
        rgbColorspace = CGColorSpaceCreateDeviceRGB()
        glossGradient = CGGradient(colorSpace: rgbColorspace!, colorComponents: components, locations: locations, count: num_locations)
        let topCenter = CGPoint(x: 0, y: 0)
        let bottomCenter = CGPoint(x: textSize.width, y: 0)
        context.drawLinearGradient(glossGradient!, start: topCenter, end: bottomCenter, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        
        UIGraphicsPopContext()
        
        guard let gradientImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return false
        }
        UIGraphicsEndImageContext()
        self.setTitleColor(UIColor(patternImage: gradientImage), for: .normal)
        return true
    }
}
