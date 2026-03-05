//
//  Date+API.swift
//  Calendar
//

import Foundation

// for API URL paths
extension Date {
    func yyyyMMdd() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.string(from: self)
    }
}
