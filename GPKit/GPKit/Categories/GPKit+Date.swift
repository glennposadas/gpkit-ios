//
//  GPKit+Date.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/28/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

extension Date {
    
    func dateAt(hours: Int, minutes: Int) -> Date {
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
    
    func isWeekend() -> Bool {
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
}
