import SwiftUI

/// Displays either the authenticated main interface or the login flow based on `AppState.isAuthenticated`.
struct ContentView: View {
    /// Shared application state injected at the app entry point.
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

