//
//  CalendarEntry.swift
//  Calendar
//

import Foundation

// one day in the schedule
struct CalendarEntry: Codable, Identifiable {
    let id: String
    let date: Date
    let holiday: Bool
    let dayID: String?
    let lessonName: String?
    let lessonID: UUID?
    
    let mainObjective: String?
    let readingDue: String?
    let dailyCodeChallengeName: String?
    let wordOfTheDay: String?
    let assignmentsDue: [Assignment]?
    let newAssignments: [Assignment]?
    
    // for grouping by month like "August 2025"
    var monthSection: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.string(from: date)
    }
}
