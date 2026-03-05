import Foundation

/// Request body for the sign-in endpoint.
struct SignInRequest: Encodable {
    /// User email address.
    let email: String
    /// Plaintext password.
    let password: String
}

/// Response payload returned on successful sign-in.
struct SignInResponseDTO: Decodable {
    /// Given name.
    let firstName: String
    /// Family name.
    let lastName: String
    /// Email address.
    let email: String
    /// Stable user identifier.
    let userUUID: UUID
    /// Bearer token used for subsequent requests.
    let secret: String
    /// Display/user name.
    let userName: String
}

/// Represents a single day in the class calendar.
struct CalendarEntry: Codable, Identifiable {
    /// Stable identifier (string from API).
    let id: String
    /// UTC date for the entry.
    let date: Date
    /// Whether the day is a holiday.
    let holiday: Bool
    /// Optional day identifier (e.g., sprint day).
    let dayID: String?
    /// Optional lesson title.
    let lessonName: String?
    /// Optional lesson UUID.
    let lessonID: UUID?
    
    /// Main objective text (detailed view).
    let mainObjective: String?
    /// Reading due description.
    let readingDue: String?
    /// Daily code challenge name.
    let dailyCodeChallengeName: String?
    /// Word of the day.
    let wordOfTheDay: String?
    /// Assignments due today.
    let assignmentsDue: [Assignment]?
    /// Assignments assigned today.
    let newAssignments: [Assignment]?
    
    /// Section title used to group entries by month, e.g., "August 2025".
    var monthSection: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.string(from: date)
    }
}

