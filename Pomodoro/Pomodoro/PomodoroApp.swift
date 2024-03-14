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

    var body: some Scene {
        WindowGroup {
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
        }
    }
}
