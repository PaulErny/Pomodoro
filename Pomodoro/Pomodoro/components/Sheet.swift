//
//  Sheet.swift
//  Pomodoro
//
//  Created by Paul Erny on 12/03/2024.
//

import SwiftUI

struct Sheet<Content: View>: View {
    init(validationButton: ValidationButtonState = .hidden,
         @ViewBuilder _ content: () -> Content,
         onValidation: (() -> ())? = nil
    ) {
        self.showOKButton = validationButton
        self.content = content()
        self.onValidation = onValidation
    }
    
    enum ValidationButtonState {
        case visible, hidden
    }
    var showOKButton: ValidationButtonState
    @ViewBuilder var content: Content
    var onValidation: (() -> ())?
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 0) {
                Spacer()
                Text("Nouveau projet")
                    .style(.label)
                    .padding(.leading, 20)
                Spacer()
                if showOKButton == .visible {
                    Button {
                        onValidation?()
                    } label: {
                        Text("OK")
                            .style(.accentLabel)
                            .underline()
                            .padding(.trailing, 20)
                    }
                }
            }
            .padding([.top, .bottom], 15)
            .background(.cardBackground)

            ZStack(alignment: .top) {
                Image("List_bg")
                    .renderingMode(.template)
                    .foregroundColor(.cardBackground)
                    .padding(.top, 80)

                content
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.background)
    }
}

struct Sheet_Previews: PreviewProvider {
    @State static var showingSheet: Bool = true
    @State static var tmpText: String = ""
    @FocusState static var focusedField: Bool
    
    static var previews: some View {        
        Text("test")
            .sheet(isPresented: $showingSheet) {
                Sheet(validationButton: .visible) {
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
                } onValidation: { print("test") }
                .menuIndicator(.visible)
                .presentationDragIndicator(.visible)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
    }
}
