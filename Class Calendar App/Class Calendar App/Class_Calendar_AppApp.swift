import SwiftUI

@main
struct Class_Calendar_AppApp: App {
    @State private var calendarData = CalendarData()
    @State private var isLoggedIn = NetworkManager.shared.userSecret != nil
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                TabView {
                    if let first = calendarData.days.first {
                        TodayView(today: first)
                            .tabItem { Label("Today", systemImage: "sun.min") }
                    } else {
                        ProgressView()
                            .onAppear { Task { await calendarData.loadData() } }
                            .tabItem { Label("Today", systemImage: "sun.min") }
                    }
                    
                    Calendar(calendarData: calendarData)
                        .tabItem { Label("Calendar", systemImage: "calendar") }
                }
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}
