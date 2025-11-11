//
//  Class_Calendar_AppApp.swift
//  Class Calendar App
//
//  Created by joseph wright on 11/10/25.
//

import SwiftUI

@main
struct Class_Calendar_AppApp: App {
    let data = TodayData()
    var body: some Scene {
        WindowGroup {
            TabView {
                TodayView(today: data.today!
                )
                .tabItem {
                    Label("Today", systemImage: "sun.min")
                }
                
                Calendar()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
            }
        }
    }
}

