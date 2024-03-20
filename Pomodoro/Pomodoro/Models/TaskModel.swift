//
//  TaskModel.swift
//  Pomodoro
//
//  Created by Paul Erny on 19/03/2024.
//

import Foundation

struct TaskModel: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var length: Int // number of pomodoros
    var labels: [LabelModel]
    var isComplete: Bool

    init(id: UUID = UUID(), name: String, length: Int = 1, labels: [LabelModel] = [], isComplete: Bool = false) {
        self.id = id
        self.name = name
        self.length = length
        self.labels = labels
        self.isComplete = isComplete
    }
}
