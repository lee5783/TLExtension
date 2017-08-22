//
//  Date+TL.swift
//  TLExtension
//
//  Created by lee5783 on 8/22/17.
//  Copyright © 2017 lee5783. All rights reserved.
//

import UIKit

extension Date {
    public func isBetweeen(date date1: Date, andDate date2: Date) -> Bool {
        return date1.compare(self as Date).rawValue * self.compare(date2 as Date).rawValue >= 0
    }
    
    public static func ISOStringFromDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT") as TimeZone!
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        return dateFormatter.string(from: date as Date).appending("Z")
    }
    
    public static func dateFromISOString(string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        dateFormatter.timeZone = NSTimeZone.local
        //        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return dateFormatter.date(from: string)!
    }
    
    public func dateToString(format: String, locale: Locale = Locale.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    public static func dateFromString(format: String, dateString: String, locale: Locale = Locale.current) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)!
    }
    
    public func isInvalidDateAndMonth() -> Bool {
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.year, .month]
        let components = calendar.dateComponents(unitFlags, from: self)
        return (components.month! == 1 && components.year! == 1970)
    }
}
