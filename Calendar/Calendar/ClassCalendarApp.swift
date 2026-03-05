//
//  ClassCalendarApp.swift
//  Calendar
//

import SwiftUI

@main
struct ClassCalendarApp: App {
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
        }
    }
}
