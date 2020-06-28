//
//  Date.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation
extension Date{
    var tomorrow: Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)
    }
    static func from(year: Int, month: Int, day: Int) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let date = gregorianCalendar.date(from: dateComponents)!
        return date
    }
    
    static func stringFromCurrentDate(format:String) -> String{
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = format;
        return dateFormatter.string(from: Date());
    }
    
    static func stringFromDate(date:Date, format:String) -> String{
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = format;
        return dateFormatter.string(from: date);
    }
    
    static func dateFromString(dateStr:String, format: String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from:dateStr)!
        return date
    }
    
    static func datestringformat(dateStr:String) -> String {
        let dateFormatter = DateFormatter()
        print("dateFormatter" , dateFormatter);
        //        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.S"
        
        let dt = dateFormatter.date(from: dateStr)
        dateFormatter.dateFormat = "dd MMM yyyy hh:mm aa"
        
        return dateFormatter.string(from: dt!)
    }
    
    static func parse(_ string: String, format: String) -> Date {
        let dateFormatter = DateFormatter()
        //        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = format
        
        guard let date = dateFormatter.date(from: string) else { return Date()}
        return date
    }
    
    func format(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        let date = dateFormatter.string(from: self)
        return date
    }
    
     func convertFormat(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.string(from: self)
        return date
    }
    
    static func parseDate(_ string: String, format: String) -> Date {
        let dateFormatter = DateFormatter()
        //        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = format
        dateFormatter.amSymbol = ""
        dateFormatter.pmSymbol = ""
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = dateFormatter.date(from: string) else { return Date()}
        return date
    }
    
    static func hourFormat(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd HH:mm a")
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.amSymbol = ""
        dateFormatter.pmSymbol = ""
        dateFormatter.locale = Locale(identifier: "en_US")
        
        return dateFormatter.string(from: dt!)
    }
    
    static func localToUTC(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.S"
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.S"
        dateFormatter.amSymbol = ""
        dateFormatter.pmSymbol = ""
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: dt!)
    }
    
    static func UTCToLocal(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.S"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.S"
        
        return dateFormatter.string(from: dt!)
    }

    
    static func dateConvertToLocalForBothTimeFormat(dateString: String) -> String {
        var convertedDateString: String?
        print("Original Date :: \(dateString)")
        // change string to Date
        let parsedDate = Date.dateFromString(dateStr: dateString, format: "yyyy-MM-dd HH:mm:ss.S")
        print("Parsed Date :: \(parsedDate)")
        // connvert format
        let formattedDate = parsedDate!.convertFormat(format: "yyyy-MM-dd HH:mm:ss.S")
        print("Formatted Date :: \(formattedDate)")
        // convert to local
        var localDate = Date.UTCToLocal(date: formattedDate)
        print("Local Date :: \(localDate)")
        // chnage date to string
        convertedDateString = Date.datestringformat(dateStr: localDate)
        print("Local Date convert String Format :: \(convertedDateString)")
        return convertedDateString!
    }
    
    static func timeConversion24(time12: String) -> String {
        let dateAsString = time12
        let df = DateFormatter()
        df.dateFormat = "hh:mm:ssa"
        
        let date = df.date(from: dateAsString)
        df.dateFormat = "HH:mm:ss"
        
        let time24 = df.string(from: date!)
        print(time24)
        return time24
    }
    
    static func getTime(otpexpiredate: Date) -> String {
        
        let calendar = NSCalendar.current
        
        //        let components = calendar.dateComponents([.hour, .year, .minute], from: self.otpexpireDate!)
        //        let year = calendar.component(.year, from: otpexpiredate)
        //        let month = calendar.component(.month, from: otpexpiredate)
        //        let day = calendar.component(.day, from: otpexpiredate)
        let hour = calendar.component(.hour, from: otpexpiredate)
        let minutes = calendar.component(.minute, from: otpexpiredate)
        let seconds = calendar.component(.second, from: otpexpiredate)
        
        let realTime = "\(hour)-\(minutes)-\(seconds)"
        
        return realTime
    }
    
    static func getDate(otpexpiredate: Date) -> Date {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day, .month, .year, .hour, .minute, .second], from: otpexpiredate as Date)
        let realdate = calendar.date(from: components)
        return realdate!
    }
    
    static func validateAge(birthDate: Date) -> Bool {
        var isValid: Bool = true;
        
        if birthDate < MAXIMUM_AGE || birthDate > MINIMUM_AGE {
            isValid = false;
        }
        
        return isValid;
    }
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }

    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
}

