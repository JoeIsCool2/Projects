//
//  MainTabView.swift
//  Calendar
//

import SwiftUI

// the 3 tabs - Home, Schedule, Assignments
struct MainTabView: View {
    @Environment(AppState.self) var appState
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            
            ScheduleView()
                .tabItem { Label("Schedule", systemImage: "calendar") }
            
            AssignmentsView()
                .tabItem { Label("Assignments", systemImage: "list.bullet") }
        }
        .tint(.blue)
    }
}
