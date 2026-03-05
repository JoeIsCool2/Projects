import SwiftUI

/// Displays a single schedule entry with date badge and lesson summary.
struct TimelineRow: View {
    /// The calendar entry to render.
    let entry: CalendarEntry
    
    /// Whether the entry's date matches the current UTC day.
    var isToday: Bool {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.isDate(entry.date, inSameDayAs: Date())
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack {
                Text(entry.date.weekday().uppercased())
                    .font(.caption).bold()
                    .foregroundColor(isToday ? .brandPrimary : .secondary)
                
                Text(entry.date.dayNumber())
                    .font(.title3).bold()
                    .foregroundColor(isToday ? .brandPrimary : .primary)
            }
            .frame(width: 44)
            
            VStack(alignment: .leading, spacing: 6) {
                if entry.holiday {
                    Text("HOLIDAY")
                        .font(.caption).bold().foregroundColor(.purple)
                        .padding(4).background(Color.purple.opacity(0.1)).cornerRadius(4)
                } else if let id = entry.dayID {
                    Text("DAY \(id)")
                        .font(.caption).bold().foregroundColor(.blue)
                }
                
                Text(entry.lessonName ?? "TBD")
                    .font(.headline)
                    .lineLimit(2)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isToday ? Color.brandPrimary : .clear, lineWidth: 2)
            )
        }
        .padding(.vertical, 4)
    }
}

