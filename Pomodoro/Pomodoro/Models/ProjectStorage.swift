//
//  ProjectStorage.swift
//  Pomodoro
//
//  Created by Paul Erny on 14/03/2024.
//

import Foundation
import SwiftUI

@MainActor
class ProjectStorage: ObservableObject {
    private var isFirstLaunch: Bool = true
    @Published var projects: [ProjectModel] = [] {
        didSet {
            if oldValue != projects && !isFirstLaunch {
                Task {
                    do {
                        try await self.save(projects: projects)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
        }
    }

    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("projects.data")
    }

    func load() async throws {
        let task = Task<[ProjectModel], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let projects = try JSONDecoder().decode([ProjectModel].self, from: data)
            return projects
        }
        let projects = try await task.value
        self.projects = projects
        self.isFirstLaunch = false
    }
    
    private func save(projects: [ProjectModel]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(projects)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
