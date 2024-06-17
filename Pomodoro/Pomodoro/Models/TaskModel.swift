//
//  TaskModel.swift
//  Pomodoro
//
//  Created by Paul Erny on 19/03/2024.
//

import Foundation

struct TaskModel: Identifiable, Codable, Equatable, Hashable {
    static func == (lhs: TaskModel, rhs: TaskModel) -> Bool {
        return (
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.length == rhs.length &&
            lhs.isComplete == rhs.isComplete &&
            lhs.labels == rhs.labels &&
            lhs.projectId == rhs.projectId
        )
    }
    
    var id: UUID
    var name: String
    var length: Int // number of pomodoros
    var note: String
    var labels: [LabelModel]
    var isComplete: Bool
    var projectId: UUID

    init(id: UUID = UUID(), name: String, length: Int = 1, note: String = "", labels: [LabelModel] = [], isComplete: Bool = false, projectId: UUID) {
        self.id = id
        self.name = name
        self.length = length
        self.note = note
        self.labels = labels
        self.isComplete = isComplete
        self.projectId = projectId
    }
}

extension TaskModel {
    static let debug = TaskModel(name: "task 4", length: 3, labels: [
        LabelModel(name: "prio 1", color: .red),
        LabelModel(name: "testLongLabel", color: .green),
        LabelModel(name: "testLongLabel", color: .blue),
        LabelModel(name: "testLongLabel", color: .blue),
        LabelModel(name: "testLongLabel", color: .blue),
    ], isComplete: false, projectId: UUID())
}
