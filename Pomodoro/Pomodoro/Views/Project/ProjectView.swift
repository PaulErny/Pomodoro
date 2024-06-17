//
//  ProjectView.swift
//  Pomodoro
//
//  Created by Paul Erny on 15/03/2024.
//

import SwiftUI

struct ProjectView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var store: ProjectStorage
    @Binding var project: ProjectModel
    
    init(project: Binding<ProjectModel>) {
        self._project = project
    }

    var body: some View {
        return VStack(spacing: 5) {
            ProjectStatsBoard(project: $project)
                .padding(.top, 10)
                .padding(.bottom, 5)

            NewTaskInput(onComplete: { taskName in
                withAnimation {
                    project.tasks.append(TaskModel(name: taskName, projectId: project.id))
                }
            })
            .padding(.bottom, 5)
            ScrollView {
                LazyVStack {
                    ForEach($project.tasks, id: \.id) { task in
                        TaskCard(task: task)
                    }
                }
            }
            .scrollIndicators(.hidden)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.background)
        // TODO: créer viewmodifier pour la navbar
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(project.name)
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
}

extension ProjectView {
    init(project: Binding<ProjectModel>?) {
        guard let project = project else {
            self._project = Binding.constant(ProjectModel(name: ""))
            return
        }
        self._project = project
    }
}

#Preview {
    @State var project = ProjectModel.fullDebugProject
    
    return VStack {
        NavigationStack {
            ProjectView(project: $project)
        }
    }
}
