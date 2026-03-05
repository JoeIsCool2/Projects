import Foundation

struct SignInResponseDTO: Codable {
    let secret: String
}

struct CalendarEntryResponseDTO: Codable {
    let id: UUID
    let date: String
    let lessonName: String?
    let lessonID: UUID?
    let dayID: String?
    let mainObjective: String?
    let readingDue: String?
    let assignmentsDue: [AssignmentResponseDTO]?
    let newAssignments: [AssignmentResponseDTO]?
    let dailyCodeChallengeName: String?
    let wordOfTheDay: String?
    let holiday: Bool
}

struct AssignmentResponseDTO: Codable {
    let id: UUID
    let name: String
}
