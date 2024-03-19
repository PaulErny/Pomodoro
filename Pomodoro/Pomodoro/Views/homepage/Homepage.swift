//
//  Homepage.swift
//  Pomodoro
//
//  Created by Paul Erny on 04/03/2024.
//

import SwiftUI

struct Homepage: View {
    @EnvironmentObject var store: ProjectStorage
    
    private var projectList: some View {
        LazyVStack {
//                    ForEach(ProjectModel.debugSample, id: \.id) { project in
//                        ProjectCard(projectName: project.name) {
//                            withAnimation {
//                                removeProject(id: project.id)
//                            }
//                        }
//                    }
             ForEach(store.projects, id: \.id) { project in
                 ProjectCard(project: project) {
                    withAnimation {
                        removeProject(id: project.id)
                    }
                }
            }
        }
        .blurScroll(10)
    }
    
    @ViewBuilder private var emptyHomepage: some View {
        VStack(alignment: .leading, spacing: 82) {
            Image("Tumbleweed")
                .renderingMode(.template)
                .foregroundColor(Color.tumbleweed)
            Text("Créez\nvotre\npremier\nprojet")
                .style(.titleAlternate)
            .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding(.top, 91)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 45) {
                Text("MES\nPROJETS")
                    .style(.title)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .leading], 45)

                if store.projects.isEmpty {
                    emptyHomepage
                        .animation(.easeInOut(duration: 0.2), value: store.projects.isEmpty)
                } else {
                    projectList
                        .animation(.easeInOut(duration: 0.2), value: store.projects.isEmpty)
                }
            }

            VStack {
                Spacer()
                AddProjectButton()
            }
        }
        .background(Color.background)
        .ignoresSafeArea()
    }
    
    private func removeProject(id: UUID) {
        store.projects.removeAll(where: { $0.id == id })
    }
}

struct homepage_Previews: PreviewProvider {
    @StateObject static var store = ProjectStorage()

    static var previews: some View {
        Homepage()
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
            .environmentObject(store)
    }
}
