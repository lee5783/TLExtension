//
//  UICollectionView+TL.swift
//  TLExtension
//
//  Created by lee5783 on 8/22/17.
//  Copyright © 2017 lee5783. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func registerCellClass(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
    }

    public func registerCellNib(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }

    public func dequeue<T: UICollectionViewCell>(aClass: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: aClass.className, for: indexPath) as! T
    }
}
