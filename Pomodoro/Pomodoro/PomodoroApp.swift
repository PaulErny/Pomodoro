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
    @State private var path = NavigationPath()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                Homepage()
                    .task {
                        do {
                            try await store.load()
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
                    .onAppear {
                        UIApplication.shared.addTapGestureRecognizer()
                    }
            }
            .environmentObject(store)
        }
    }
}
