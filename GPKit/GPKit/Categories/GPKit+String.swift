//
//  GPKit+String.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

public extension String {
    
    /** Identical to the extension of UITextField's hasValue()
     */
    
    public func hasValidValue() -> Bool {
        let whitespaceSet = CharacterSet.whitespaces
        
        if self == "" || self == " " {
            return false
        }
        
        if self.trimmingCharacters(in: whitespaceSet).isEmpty
            || self.trimmingCharacters(in: whitespaceSet).isEmpty {
            return false
        }
        
        return true
    }
    
    /** Clever function to add/append paths as strings just like in Firebase.
     */
    
    public func append(path: String) -> String {
        return "\(self)\(path)"
    }
    
    /** Checks if the input email is valid or not
     */
    
    public func isValidEmail() -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
        
    }
    
    /** Handles date formatiing from String to String
     *  Input: Self. Ex: "2017-01-11 07:10:36"
     *  Returns: String: "Jan 2017"
     */
    
    func convertToReadableDateFormat() -> String {
        let dateFormatter = DateFormatter()
        let geoDriveDateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        geoDriveDateFormatter.dateFormat = "MMM yyyy"
        
        let date = dateFormatter.date(from: self)
        
        return geoDriveDateFormatter.string(from: date!)
    }
    
    /** Extract month from a string
     */
    
    func extractMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let myDate = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "MM"
            let finalMonth = dateFormatter.string(from: myDate)
            
            if let monthInt = Int(finalMonth) {
                let monthName = dateFormatter.monthSymbols[monthInt - 1]
                return monthName
            }
        }
        
        return ""
    }
    
    /** Extract year from a string
     */
    
    func extractYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let myDate = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "yyyy"
            let finalDate = dateFormatter.string(from: myDate)
            return finalDate
        }
        
        return ""
    }
    
    /** Convert a String (month symbol) to Int String
     *  January --> "1"
     */
    
    func convertMonthSymbolToInt() -> String {
        return "\(DateFormatter().monthSymbols.index(of: self)! + 1)"
    }
    
    /** Generates random alphanumeric string for image key
     */
    
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.characters.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}

public class GPKitString {
    
    /** Returns the cool format for Date and Time now.
     */
    
    class func dateTimeNowString() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.short
        dateformatter.timeStyle = DateFormatter.Style.short
        
        let now = dateformatter.string(from: Date())
        
        return now
    }
}
