//
//  ProjectCreationSheet.swift
//  Pomodoro
//
//  Created by Paul Erny on 11/03/2024.
//

import SwiftUI

protocol ProjectCreationSheetDelegate {
    func onComplete(projectName: String)
}

struct ProjectCreationSheet: View {
    @State var projectName: String = ""
    @FocusState private var focusedField: Bool
    @Binding var showingSheet: Bool
    var delegate: ProjectCreationSheetDelegate?
    @State private var isContentValid: Bool = true

    var body: some View {
        Sheet(validationButton: .visible) {
            // TODO: suppr "test
            TextField("test", text: $projectName, prompt: Text("Nom du projet").font(.labelFont).foregroundColor(.label))
                .font(.labelFont) //tmp
                .foregroundColor(.label) //tmp
                .frame(maxWidth: .infinity, minHeight: 54, alignment: .leading)
                .padding(.leading, 45)
                .background(
                    Rectangle()
                        .fill(
                            .shadow(.inner(color: .black.opacity(0.15), radius: 4 ))
                        )
                        .foregroundStyle(isContentValid ? Color.inputBackground : .red) // TODO: changer .red
                        .border(Color.cardBackground, width: 2)
                )
                .focused($focusedField)
                .onAppear {
                    focusedField = true
                }
        } onValidation: {
            if checkIsContentValid() {
                showingSheet = false
                delegate?.onComplete(projectName: projectName)
            }
        }
    }
    
    func checkIsContentValid() -> Bool {
        // TODO: .
        if projectName.isEmpty {
            isContentValid = false // TODO: rouge custom + animation
            return false
        }
        isContentValid = true
        return true
    }
}

struct ProjectCreationSheet_Previews: PreviewProvider {
    @State static var showingSheet: Bool = true
    
    static var previews: some View {
        Text("test")
            .sheet(isPresented: $showingSheet) {
                ProjectCreationSheet(showingSheet: $showingSheet)
                    .menuIndicator(.visible)
                    .presentationDragIndicator(.visible)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
    }
}
