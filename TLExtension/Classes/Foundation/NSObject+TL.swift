//
//  NSObject+TL.swift
//  TLExtension
//
//  Created by lee5783 on 8/22/17.
//  Copyright © 2017 lee5783. All rights reserved.
//

import UIKit

extension NSObject {
    public var className: String {
        return type(of: self).className
    }
    
    public static var className: String {
        return String.className(aClass: self)
    }
}

public func arrayMax<T: Comparable>(array: [T]) -> T? {
    return array.reduce(array.first!) { $0 > $1 ? $0 : $1 }
}

public func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

public func runOnMainThread(callback: @escaping () -> Void) {
    DispatchQueue.main.async {
        callback()
    }
}

public func runOnMainThreadAfterDelay(delay: Double, _ callback: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: callback)
}

public func error(msg: String) -> NSError {
    return NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: msg])
}

extension Array where Element: Equatable {
    // Remove first collection element that is equal to the given `object`:
    public mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}
