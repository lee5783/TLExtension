//
//  UIStoryboard+TL.swift
//  TLExtension
//
//  Created by lee5783 on 8/22/17.
//  Copyright © 2017 lee5783. All rights reserved.
//

import UIKit

extension UIStoryboard {
    public func initializeController<T: UIViewController>(withClass: T.Type) -> T {
        return self.instantiateViewController(withIdentifier: withClass.className) as! T
    }
}
