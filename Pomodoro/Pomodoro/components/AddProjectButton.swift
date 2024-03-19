//
//  AddProjectButton.swift
//  Pomodoro
//
//  Created by Paul Erny on 06/03/2024.
//

import SwiftUI

struct AddProjectButton: View, ProjectCreationSheetDelegate {
    @State private var showingSheet = false
    @State var shouldOpenProject: Bool = false
    @EnvironmentObject var store: ProjectStorage
//    @State private var newProject: ProjectModel?
    @State private var newProject = ProjectModel(name: "temporary")

    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.title)
                .frame(width: 66, height: 66)
                .shadow(color: Color("testBtnShadow"), radius: 0, x: -4, y: 5)
                .overlay {
                    Image(systemName: "plus")
                        .font(.system(size: 62))
                        .foregroundColor(.background)
                }
        }
        .padding(.bottom, 27)
        .sheet(isPresented: $showingSheet) {
            ProjectCreationSheet(showingSheet: $showingSheet, delegate: self)
                .menuIndicator(.visible)
                .presentationDragIndicator(.visible)
        }
        .navigationDestination(isPresented: $shouldOpenProject, destination: { ProjectView(project: newProject) })
    }
    
    func onComplete(projectName: String) {
        let newProject = ProjectModel(name: projectName)
        store.projects.append(newProject)
        self.newProject = newProject
        shouldOpenProject = true
    }
}

struct AddProjectButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VStack {
                Spacer()
                AddProjectButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
        }
    }
}
