//
//  TaskCard.swift
//  Pomodoro
//
//  Created by Paul Erny on 19/03/2024.
//

import SwiftUI

struct TaskCard: View {
    var task: TaskModel
    private var isLargeCard: Bool {
        return task.length > 1 || !task.labels.isEmpty
    }

    private let doneImage = Image("done")
    private let playImage = Image("play")
    
    var body: some View {
        NavigationLink(destination: {}) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(task.name)
                        .style(.label)
                        .padding(.top, isLargeCard ? 7 : 0)
                    if isLargeCard {
                        getSubLabels()
                            .padding(.bottom, 5)
                    }
                }
                .padding(.leading, 30)

                Spacer()

                getRightImage()
            }
            .frame(minHeight: 44)
//            .frame(height: isLargeCard ? 66 : 44)
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color.cardBackground)
                    .shadow(color: Color.cardShadow, radius: 0, x: -3, y: 4)
            )
            .padding([.leading, .trailing], 7)
        }
    }
    
    func getRightImage() -> some View {
        task.isComplete ? doneImage.padding(.trailing, 13) : playImage.padding(.trailing, 13)
    }
    
    func getSubLabels() -> some View {
        return TagsCollectionView(tags: task.labels) {
            if task.length > 1 {
                HStack(spacing: 0) {
                    Text("durée: ")
                        .style(.sublabel)
                        .padding(.trailing, 5)
                    HStack(spacing: 2) {
                        ForEach(0...task.length - 1, id: \.self) {_ in
                            Image("Clock")
                        }
                    }.padding(.trailing, 10)
                }
            }
        }
    }
}

struct TaskCard_Previews: PreviewProvider {
    static let task = TaskModel(name: "task 1")
    static let taskWithLabels = TaskModel(name: "task 2", labels: [
        LabelModel(name: "prio 1", color: .red),
        LabelModel(name: "testLongLabel", color: .green)
    ], isComplete: true)
    static let longTask = TaskModel(name: "task 3", length: 2)
    static let taskFull = TaskModel(name: "task 4", length: 3, labels: [
        LabelModel(name: "prio 1", color: .red),
        LabelModel(name: "testLongLabel", color: .green),
        LabelModel(name: "testLongLabel", color: .blue),
        LabelModel(name: "testLongLabel", color: .blue),
        LabelModel(name: "testLongLabel", color: .blue),
    ], isComplete: true)
    
    static var previews: some View {
        NavigationStack {
            VStack {
                TaskCard(task: task)
                TaskCard(task: taskWithLabels)
                TaskCard(task: longTask)
                TaskCard(task: taskFull)
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
        }
    }
}
