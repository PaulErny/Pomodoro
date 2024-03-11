//
//  ProjectCreationSheet.swift
//  Pomodoro
//
//  Created by Paul Erny on 11/03/2024.
//

import SwiftUI

struct ProjectCreationSheet: View {
//    enum FocusedField: Hashable {
//        case field
//    }
    
    @State var tmpText: String = ""
//    @FocusState var focusedField: FocusedField?
    @FocusState var focusedField: Bool

    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 0) {
                Spacer()
                Text("Nouveau projet")
                    .style(.label)
                    .padding(.leading, 20)
                Spacer()
                Text("OK")
                    .style(.accentLabel)
                    .underline()
                    .padding(.trailing, 20)
            }
            .padding([.top, .bottom], 15)
            .background(.cardBackground)

            // input field
            TextField("test", text: $tmpText, prompt: Text("Nom du projet").font(.labelFont).foregroundColor(.label))
                .font(.labelFont) //tmp
                .foregroundColor(.label) //tmp
                .frame(maxWidth: .infinity, minHeight: 54, alignment: .leading)
                .padding(.leading, 45)
                .background(
                    Rectangle()
                        .fill(Color.inputBackground)
                        .border(Color.cardBackground, width: 2)
                )
//                .focused($focusedField, equals: .field)
                .focused($focusedField)
                .onAppear {
//                    self.focusedField = .field
                    focusedField = true
                }
            
            Image("List_bg")
                .renderingMode(.template)
                .foregroundColor(.cardBackground)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.background)
    }
}

struct ProjectCreationSheet_Previews: PreviewProvider {
    @State static var showingSheet: Bool = true
    
    static var previews: some View {
        Text("test")
            .sheet(isPresented: $showingSheet) {
                ProjectCreationSheet()
                    .menuIndicator(.visible)
                    .presentationDragIndicator(.visible)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
    }
}
