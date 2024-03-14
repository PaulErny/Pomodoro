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
                Homepage(projects: $store.projects) {
                    Task {
                        do {
                            try await store.save(projects: store.projects)
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
                    .task {
                        do {
                            try await store.load()
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
            }
//            }
        }
    }
}
