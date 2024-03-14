//
//  PojectModel.swift
//  Pomodoro
//
//  Created by Paul Erny on 14/03/2024.
//

import Foundation

struct ProjectModel: Identifiable, Codable {
    var id: UUID
    var name: String

    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

extension ProjectModel {
    static let debugSample: [ProjectModel] =
    [
        ProjectModel(name: "project 1"),
        ProjectModel(name: "project 2"),
        ProjectModel(name: "project 3"),
        ProjectModel(name: "project 4"),
        ProjectModel(name: "project 5"),
        ProjectModel(name: "project 6"),
        ProjectModel(name: "project 7"),
        ProjectModel(name: "project 8"),
        ProjectModel(name: "project 9"),
        ProjectModel(name: "project 10")
    ]
}
