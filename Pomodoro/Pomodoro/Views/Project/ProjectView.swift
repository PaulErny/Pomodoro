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
    @State var project: ProjectModel
    
    init(project: ProjectModel) {
        self.project = project
    }

    var body: some View {
        VStack(spacing: 10) {
            //  stats
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.cardBackground)
                .frame(height: 180)
                .padding([.leading, .trailing], 7)
                .padding(.top, 10)

            NewTaskInput(onComplete: { taskName in
                withAnimation {
                    project.tasks.append(TaskModel(name: taskName))
                }
            })
            
            ScrollView {
                LazyVStack {
                    ForEach(project.tasks, id: \.id) { task in
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

struct ProjectView_Previews: PreviewProvider {
    static let project = ProjectModel.debugProject

    static var previews: some View {
        NavigationStack {
            ProjectView(project: project)
        }
    }
}
