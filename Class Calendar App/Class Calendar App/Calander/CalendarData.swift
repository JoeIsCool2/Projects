import SwiftUI
import Combine

@Observable
class CalendarData {
    var days: [Today] = []
    
    func loadData() async {
        let dtos = await NetworkManager.shared.fetchCalendar()
        await MainActor.run {
            self.days = dtos.map { Today(from: $0) }
        }
    }
    
    func findCurrentCalendar(indicator: String) -> [Today] {
        return days.filter { $0.lessonID.contains(indicator) }
    }
    
    func findData() -> [String] {
        var allTypes: [String] = []
        for day in days {
            if day.lessonID.count >= 2 {
                let prefix = String(day.lessonID.prefix(2))
                if !allTypes.contains(prefix) {
                    allTypes.append(prefix)
                }
            }
        }
        return allTypes
    }
}
