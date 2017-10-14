//
//  UINavigationBar+TL.swift
//  TLExtension
//
//  Created by lee5783 on 8/22/17.
//  Copyright © 2017 lee5783. All rights reserved.
//

import UIKit

extension UINavigationBar {
    public func setNavigationBarTintColor(color: UIColor!, andAlpha alpha: CGFloat = 1) {
        var targetAlpha = alpha
        if targetAlpha > 1 {
            targetAlpha = 1
        }
        
        if targetAlpha < 0 {
            targetAlpha = 0
        }
        
        self.isTranslucent = targetAlpha < 1
        
        let backgroundImage = UIImage.create(size: CGSize(width: self.bounds.width, height: self.bounds.height + 20), solidColor: color.withAlphaComponent(targetAlpha))
        self.setBackgroundImage(backgroundImage, for: .default)
    }

    public func hideBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(view: self)
        navigationBarImageView!.isHidden = true
    }
    
    public func showBottomHairline() {
        if let navigationBarImageView = hairlineImageViewInNavigationBar(view: self) {
            navigationBarImageView.isHidden = false
        }
    }
    
    private func hairlineImageViewInNavigationBar(view: UIView) -> UIImageView? {
        if view.isKind(of: UIImageView.self) && view.bounds.height <= 1.0 {
            return (view as? UIImageView)
        }
        
        let subviews = (view.subviews as [UIView])
        for subview: UIView in subviews {
            if let imageView = hairlineImageViewInNavigationBar(view: subview) {
                return imageView
            }
        }
        
        return nil
    }
    
    public func setupDefaultNavigationBarAppearance() {
        UINavigationBar.appearance().tintColor  = .white
        self.tintColor = .white
        self.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)
        ]
    }
}
