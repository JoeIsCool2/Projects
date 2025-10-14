//
//  Personality_QuizApp.swift
//  Personality Quiz
//
//  Created by joseph wright on 10/13/25.
//

import SwiftUI

@main
struct Personality_QuizApp: App {
    @State var isStarted: Bool = false
    var body: some Scene {
        WindowGroup {
            if isStarted {
                ContentView(isStarted: $isStarted)
            } else {
                StartScreen(isStarted: $isStarted)
            }
        }
    }
}

#Preview {
    // Simple wrapper for previewing the start screen state
    AppPreviewWrapper()
}

struct AppPreviewWrapper: View {
    @State private var isStarted = false
    
    var body: some View {
        Group {
            if isStarted {
                ContentView(isStarted: $isStarted)
            } else {
                StartScreen(isStarted: $isStarted)
            }
        }
    }
}
