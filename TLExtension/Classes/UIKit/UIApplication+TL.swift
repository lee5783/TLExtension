//
//  UIApplication+TL.swift
//  TLExtension
//
//  Created by lee5783 on 8/22/17.
//  Copyright © 2017 lee5783. All rights reserved.
//

import UIKit

extension UIApplication {
    public static func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
