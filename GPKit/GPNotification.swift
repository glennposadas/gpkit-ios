//
//  GPNotification.swift
//  GPKit
//
//  Created by Glenn Posadas on 6/17/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit
import UserNotifications

public class GPNotification {
    
    /** Public class function for presenting a local notification immediately.
     *  @params - message.
     */
    
    public class func presentLocalNotification(message: String) {
        let localNotification = UILocalNotification()
        localNotification.alertBody = message
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        UIApplication.shared.presentLocalNotificationNow(localNotification)
    }
    
    /** A public class function for cancelling all scheduled local notifications
     */
    
    public class func cancelScheduledLocalNotifications() {
        UIApplication.shared.cancelAllLocalNotifications()
    }
    
    /** A public class function used for scheduling local notification.
     *  @params 
     *  - hour: Int (ex. 1 for 1 o'clock)
     *  - minute: Int (ex. 30 for 30 minutes)
     */
    
    public class func scheduleLocalNotification(hour: Int, minute: Int, notificationMessage: String, category: String? = nil) {
        
        // have to use NSCalendar for the components
        let calendar = NSCalendar(identifier: .gregorian)!;
        
        var dateFire = Date()
        
        var fireComponents = calendar.components(
            [NSCalendar.Unit.day,
             NSCalendar.Unit.month,
             NSCalendar.Unit.year,
             NSCalendar.Unit.hour,
             NSCalendar.Unit.minute],
            from:dateFire)
        
        // if today's date is passed, use tomorrow
        if (fireComponents.hour! > hour || (fireComponents.hour == hour && fireComponents.minute! >= minute) ) {
            
            dateFire = dateFire.addingTimeInterval(86400)  // Use tomorrow's date
            fireComponents = calendar.components(
                [NSCalendar.Unit.day,
                 NSCalendar.Unit.month,
                 NSCalendar.Unit.year,
                 NSCalendar.Unit.hour,
                 NSCalendar.Unit.minute],
                from:dateFire);
        }
        
        // set up the time
        fireComponents.hour = hour
        fireComponents.minute = minute
        
        // schedule local notification
        dateFire = calendar.date(from: fireComponents)!
        
        let localNotification = UILocalNotification()
        localNotification.fireDate = dateFire
        localNotification.alertBody = notificationMessage
        localNotification.repeatInterval = NSCalendar.Unit.day
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.category = category
        
        UIApplication.shared.scheduleLocalNotification(localNotification)
    }
}
