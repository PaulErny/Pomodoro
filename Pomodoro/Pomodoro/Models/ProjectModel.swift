//
//  PojectModel.swift
//  Pomodoro
//
//  Created by Paul Erny on 14/03/2024.
//

import Foundation

struct ProjectModel: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var tasks: [TaskModel]

    init(id: UUID = UUID(), name: String, tasks: [TaskModel] = []) {
        self.id = id
        self.name = name
        self.tasks = tasks
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
    
    static let debugProject = ProjectModel(name: "project 1", tasks: [
        TaskModel(name: "task 1", length: 1, isComplete: true),
        TaskModel(name: "task 2", length: 2, isComplete: true),
        TaskModel(name: "task 3", length: 1, labels: [
            LabelModel(name: "prio 1", color: .red),
            LabelModel(name: "testLongLabel", color: .green),
        ], isComplete: false),
        TaskModel(name: "task 4", length: 3, labels: [
            LabelModel(name: "prio 1", color: .red),
            LabelModel(name: "testLongLabel", color: .green),
            LabelModel(name: "testLongLabel", color: .blue),
            LabelModel(name: "testLongLabel", color: .blue),
            LabelModel(name: "testLongLabel", color: .blue),
        ], isComplete: false)
    ])
}
