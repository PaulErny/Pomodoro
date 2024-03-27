//
//  NewTaskInput.swift
//  Pomodoro
//
//  Created by Paul Erny on 20/03/2024.
//

import SwiftUI

struct NewTaskInput: View {
    @State private var taskName: String = ""
    @State private var isContentValid: Bool = true
    var onComplete: ((String) -> Void)?
    
    var body: some View {
        TextField("Task name", text: $taskName, prompt: Text("Ajouter une tâche").font(.labelFont).foregroundColor(.label))
            .font(.labelFont) //tmp
            .foregroundColor(.label) //tmp
            .frame(maxWidth: .infinity, minHeight: 44, alignment: .leading)
            .padding(.leading, 45)
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color.cardBackground)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .fill(
                                .shadow(.inner(color: .black.opacity(0.15), radius: 4 ))
                            )
                            .padding(2)
                            .foregroundStyle(isContentValid ? Color.inputBackground : .red) // TODO: changer .red
                            .overlay(
                                Image(systemName: "plus")
                                    .renderingMode(.template)
                                    .foregroundColor(.label)
                                    .font(.title)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 10)
                            )
                    )
            )
            .padding([.leading, .trailing], 7)
            .submitLabel(.done)
            .onSubmit {
                if checkIsContentValid() {
                    onComplete?(taskName)
                }
            }
    }
    
    func checkIsContentValid() -> Bool {
        // TODO: .
        if taskName.isEmpty {
            isContentValid = false // TODO: rouge custom + animation
            return false
        }
        isContentValid = true
        return true
    }
}

#Preview {
    VStack {
        NewTaskInput()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}
