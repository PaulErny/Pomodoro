//
//  PomodoroApp.swift
//  Pomodoro
//
//  Created by Paul Erny on 01/03/2024.
//

import SwiftUI

@main
struct PomodoroApp: App {
    @StateObject private var store = ProjectStorage()
//    @State var navigationPath = NavigationPath()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            NavigationStack(path: $navigationPath) {
            NavigationStack {
                Homepage()
                    .task {
                        do {
                            try await store.load()
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
                    .environmentObject(store)
            }
//            }
        }
    }
}
