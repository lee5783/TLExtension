//
//  UITableView+TL.swift
//  TLExtension
//
//  Created by lee5783 on 8/22/17.
//  Copyright © 2017 lee5783. All rights reserved.
//

import UIKit

extension UITableView {
    public func registerCellNib(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    public func registerHeaderFooterViewClass(viewClass: AnyClass) {
        let identifier = String.className(aClass: viewClass)
        self.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    public func registerHeaderFooterViewNib(viewClass: AnyClass) {
        let identifier = String.className(aClass: viewClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    public func dequeue<T: UITableViewCell>(aClass: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: aClass.className) as! T
    }
    
    public func dequeue<T: UITableViewHeaderFooterView>(aClass: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: aClass.className) as! T
    }
}
