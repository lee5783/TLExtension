//
//  NSError+TL.swift
//  TLExtension
//
//  Created by lee5783 on 8/22/17.
//  Copyright © 2017 lee5783. All rights reserved.
//

import UIKit

extension NSError {
    public static func errorWithMessage(code: Int, msg: String) -> NSError {
        var userInfo = [String: AnyObject]()
        userInfo[NSLocalizedDescriptionKey] = msg as AnyObject?
        userInfo[NSLocalizedFailureReasonErrorKey] = msg as AnyObject?
        let error = NSError(domain: "Error", code: code, userInfo: userInfo)
        return error
    }
}
