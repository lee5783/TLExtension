//
//  UIView+TL.swift
//  TLExtension
//
//  Created by lee5783 on 8/22/17.
//  Copyright © 2017 lee5783. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        
        set(value) {
            if value <= 0 {
                self.layer.cornerRadius = 0
            } else {
                self.clipsToBounds = true
                self.layer.cornerRadius = value
            }
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        
        set(value) {
            self.layer.borderWidth = value
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        get {
            return self.layer.borderColor == nil ? nil : UIColor(cgColor: self.layer.borderColor!)
        }
        
        set(value) {
            self.layer.borderColor = value == nil ? nil : value!.cgColor
        }
    }
    
    public func shake(count: Float? = nil,for duration: TimeInterval? = nil, withTranslation translation: Float? = nil) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        animation.repeatCount = count ?? 2
        animation.duration = (duration ?? 0.5)/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation ?? -5
        layer.add(animation, forKey: "shake")
    }
    
    public func shakeView() {
        self.shake(count: 3, for: 0.3, withTranslation: 10)
    }
}
