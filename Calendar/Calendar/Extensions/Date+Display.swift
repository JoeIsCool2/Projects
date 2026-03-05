//
//  Date+Display.swift
//  Calendar
//

import Foundation

// date formatting for showing in the UI
extension Date {
    // "Tuesday, January 23" in UTC
    func utcFormatted() -> String {
        let f = DateFormatter()
        f.dateFormat = "EEEE, MMMM d"
        f.timeZone = TimeZone(secondsFromGMT: 0)
        return f.string(from: self)
    }
    
    // just the day number like "23"
    func dayNumber() -> String {
        let f = DateFormatter()
        f.dateFormat = "d"
        f.timeZone = TimeZone(secondsFromGMT: 0)
        return f.string(from: self)
    }
    
    // short weekday like "Tue"
    func weekday() -> String {
        let f = DateFormatter()
        f.dateFormat = "EEE"
        f.timeZone = TimeZone(secondsFromGMT: 0)
        return f.string(from: self)
    }
}
