//
//  TimelineRow.swift
//  Calendar
//

import SwiftUI

// one row in the schedule list
struct TimelineRow: View {
    let entry: CalendarEntry
    
    var isToday: Bool {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.isDate(entry.date, inSameDayAs: Date())
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(spacing: 2) {
                Text(entry.date.weekday())
                    .font(.caption)
                    .foregroundColor(isToday ? .blue : .secondary)
                Text(entry.date.dayNumber())
                    .font(.headline)
                    .foregroundColor(isToday ? .blue : .primary)
            }
            .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                if entry.holiday {
                    Text("Holiday")
                        .font(.caption)
                        .foregroundColor(.purple)
                } else if let id = entry.dayID {
                    Text("Day \(id)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Text(entry.lessonName ?? "TBD")
                    .font(.headline)
                    .lineLimit(2)
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(8)
        }
        .padding(.vertical, 2)
    }
}
