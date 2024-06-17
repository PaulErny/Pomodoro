//
//  TaskView.swift
//  Pomodoro
//
//  Created by Paul Erny on 27/05/2024.
//

import SwiftUI

struct TaskView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var store: ProjectStorage
    
    @Binding var task: TaskModel
//    var projectId: UUID
    
    init(task: Binding<TaskModel>) {
        self._task = task
    }

    var body: some View {
        VStack(spacing: 10) {
            TaskMain(name: task.name, isComplete: task.isComplete)
            .padding(.top, 10)
            PomodorosCard(pomodorosCount: $task.length)
            MultiLineTextfield(text: $task.note)
            DeleteButton(onDelete: { deleteTask() })
                .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.background)
        // TODO: créer viewmodifier pour la navbar
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(task.name)
                    .style(.label)
            }

            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.label)
                        .imageScale(.large)
                }
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.cardBackground, for: .navigationBar)
    }
    
    func deleteTask() {
        guard let index = store.projects.firstIndex(where: { $0.id == task.projectId }) else { return }
        store.projects[index].tasks.removeAll(where: { $0.id == task.id })
    }
}

#Preview {
    @State var task = TaskModel.debug
    
    return NavigationStack {
        TaskView(task: $task)
    }
}
