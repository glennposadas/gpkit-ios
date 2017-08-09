//
//  Date+GPKit.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/28/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

public extension Date {
    
    public func dateAt(hours: Int, minutes: Int) -> Date {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        //get the month/day/year componentsfor today's date.
        
        var date_components = calendar.components(
            [NSCalendar.Unit.year,
             NSCalendar.Unit.month,
             NSCalendar.Unit.day],
            from: self)
        
        //Create an NSDate for the specified time today.
        date_components.hour = hours
        date_components.minute = minutes
        date_components.second = 0
        
        let newDate = calendar.date(from: date_components)!
        return newDate
    }
    
    /** Function to check if a date is in weekend of weekday
     *  @returns true if saturday or sunday. Otherwise, false.
     */
    
    public func isWeekend() -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        let dayString = dateFormatter.string(from: self)
        
        if let weekedayNumber = dateFormatter.weekdaySymbols.index(of: dayString) {
            switch weekedayNumber {
            case 0, 6:  return true
            default:    return false
            }
        }
        
        return true
    }
    
    /** Function used to count the days from today to self.
     *  Date format accepted: yyyy-MM-dd HH:mm:ss
     */
    
    public func countDaysFromToday() -> Int? {
        let calendar = Calendar.current
        
        let now = Date()
        
        let date1 = calendar.startOfDay(for: now)
        let date2 = calendar.startOfDay(for: self)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        return components.day
    }
}
