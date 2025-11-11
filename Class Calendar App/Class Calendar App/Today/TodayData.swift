import SwiftUI

struct TodayData {
    let data = CalendarData()
    
    var today: Today? {
        for day in data.days {
            if day.lessonID == "TP27" {
                return day
            }
        }
        return nil
    }
}


