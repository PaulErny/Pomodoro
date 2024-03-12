//
//  ProjectCreationSheet.swift
//  Pomodoro
//
//  Created by Paul Erny on 11/03/2024.
//

import SwiftUI

struct ProjectCreationSheet: View {
    @State var tmpText: String = ""
    @FocusState private var focusedField: Bool
    @Binding var showingSheet: Bool
    var delegate: SheetDelegate?
    @State private var isContentValid: Bool = true

    var body: some View {
        Sheet(validationButton: .visible) {
            TextField("test", text: $tmpText, prompt: Text("Nom du projet").font(.labelFont).foregroundColor(.label))
                .font(.labelFont) //tmp
                .foregroundColor(.label) //tmp
                .frame(maxWidth: .infinity, minHeight: 54, alignment: .leading)
                .padding(.leading, 45)
                .background(
                    Rectangle()
                        .fill(isContentValid ? Color.inputBackground : .red)
                        .border(Color.cardBackground, width: 2)
                )
                .focused($focusedField)
                .onAppear {
                    focusedField = true
                }
        } onValidation: {
            if checkIsContentValid() {
                showingSheet = false
                delegate?.onComplete()
            }
        }
    }
    
    func checkIsContentValid() -> Bool {
        // TODO: .
        if tmpText.isEmpty {
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
