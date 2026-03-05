import SwiftUI

/// Hosts the main tabs for the app: Dashboard, Schedule, and Assignments.
struct MainTabView: View {
    @Environment(AppState.self) var appState
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            
            ScheduleView()
                .tabItem { Label("Schedule", systemImage: "calendar") }
            
            // NEW: The Assignments Tab
            AssignmentsView()
                .tabItem { Label("Assignments", systemImage: "list.bullet.clipboard") }
        }
        .accentColor(.brandPrimary)
    }
}
