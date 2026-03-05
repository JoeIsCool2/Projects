import SwiftUI

/// Main app struct responsible for bootstrapping shared state and root view.
@main
struct ClassCalendarApp: App {
    /// Shared application state for authentication and data.
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(appState)
        }
    }
}

