//
//  PojectModel.swift
//  Pomodoro
//
//  Created by Paul Erny on 14/03/2024.
//

import Foundation

struct Time: Codable, Equatable, Hashable {
    var hours: Int
    var minutes: Int
    
    var inMinutes: Int {
        hours * 60 + minutes
    }
    
    init(hours: Int, minutes: Int) {
        self.hours = hours
        self.minutes = minutes
    }
}

struct ProjectModel: Identifiable, Codable, Equatable, Hashable {
    static func == (lhs: ProjectModel, rhs: ProjectModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: UUID
    var name: String
    var pomodoroLength: Time // in minutes / per pomodoro
    var pomodorosBeforeBreak: Int
    var smallBreakLength: Time // in minutes
    var longBreakLength: Time // in minutes
    var tasks: [TaskModel]

    init(id: UUID = UUID(), 
         name: String,
         pomodoroLength: Time = Time(hours: 0, minutes: 25),
         pomodorosBeforeBreak: Int = 4,
         smallBreakLength: Time = Time(hours: 0, minutes: 5),
         longBreakLength: Time = Time(hours: 0, minutes: 15),
         tasks: [TaskModel] = []) {
        self.id = id
        self.name = name
        self.pomodoroLength = pomodoroLength
        self.pomodorosBeforeBreak = pomodorosBeforeBreak
        self.smallBreakLength = smallBreakLength
        self.longBreakLength = longBreakLength
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
    
    static let fullDebugProject = ProjectModel(
        name: "project 1",
        pomodoroLength: Time(hours: 0, minutes: 20),
        pomodorosBeforeBreak: 6,
        smallBreakLength: Time(hours: 0, minutes: 7),
        longBreakLength: Time(hours: 0, minutes: 35),
        tasks: [
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
        ]
    )
}
