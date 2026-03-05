//
//  ContentView.swift
//  Calendar
//

import SwiftUI

// shows either login screen or main app depending on if theyre logged in
struct ContentView: View {
    @Environment(AppState.self) var appState
    
    var body: some View {
        Group {
            if appState.isAuthenticated {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}
