//
//  ContentView.swift
//  Calendar
//

import SwiftUI

// shows either login screen or main app depending on if theyre logged in
struct ContentView: View {
    @Environment(AppState.self) var appState
    
    var body: some View {
        ZStack {
            Color.brandBackground.ignoresSafeArea()
            
            if appState.isAuthenticated {
                MainTabView()
                    .transition(.move(edge: .trailing))
            } else {
                LoginView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.4), value: appState.isAuthenticated)
    }
}
