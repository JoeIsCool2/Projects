//
//  Random_APIsApp.swift
//  Random APIs
//
//  Created by joseph wright on 12/1/25.
//

import SwiftUI

@main
struct Random_APIsApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Dog", systemImage: "pawprint") {
                    DogView()
                }
//                    .tabItem {
//                        Label("Dog", systemImage: "pawprint")
//                    }
                Tab("Representative", systemImage: "person.2") {
                    RepresentativeView()
                }
//                RepresentativeView()
//                    .tabItem {
//                        Label("Representative", systemImage: "person.2")
//                    }
            }
        }
    }
}

