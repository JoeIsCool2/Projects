import SwiftUI

struct Today: Identifiable {
    let id = UUID()
    let lessonID: String
    let lessonName: String
    let mainObjective: String
    let readingDue: String
    let assignmentsDue: String
    let newAssignments: String
    let dailyCodeChallengeName: String
    let wordOfTheDay: String
    let color: Color
    var completed = false
    
    init(from dto: CalendarEntryResponseDTO) {
        self.lessonID = dto.dayID ?? "Holiday"
        self.lessonName = dto.lessonName ?? (dto.holiday ? "Holiday" : "No Class")
        self.mainObjective = dto.mainObjective ?? ""
        self.readingDue = dto.readingDue ?? ""
        
        let dueNames = dto.assignmentsDue?.map { $0.name } ?? []
        self.assignmentsDue = dueNames.joined(separator: ", ")
        
        let newNames = dto.newAssignments?.map { $0.name } ?? []
        self.newAssignments = newNames.joined(separator: ", ")
        
        self.dailyCodeChallengeName = dto.dailyCodeChallengeName ?? ""
        self.wordOfTheDay = dto.wordOfTheDay ?? ""
        self.color = Color.random()
    }
}
