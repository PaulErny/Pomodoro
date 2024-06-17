//
//  MultiLineTextfield.swift
//  Pomodoro
//
//  Created by Paul Erny on 28/05/2024.
//

import SwiftUI

struct MultiLineTextfield: View {
    @Binding var text: String
    
    var body: some View {
        
        TextEditor(text: $text)
            .font(.labelFont) //tmp
            .foregroundStyle(Color.label) // tmp
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 240, alignment: .topLeading)
            .background {
                if text.isEmpty {
                    Text("Ajouter une note...")
                        .font(.labelFont)
                        .padding([.top, .leading], 6)
                        .foregroundStyle(Color.label.opacity(0.5))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
            }
            .padding(.leading, 45)
            .padding(.trailing, 30)
            .padding(.top)
            .padding(.bottom, 4)
            .scrollContentBackground(.hidden)
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color.cardBackground)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .fill(
                                .shadow(.inner(color: .black.opacity(0.12), radius: 4 ))
                            )
                            .padding(2)
                            .foregroundStyle(Color.inputBackground)
                    )
            )
            .padding([.leading, .trailing], 7)
    }
}

#Preview {
    @State var text = ""
    
    return MultiLineTextfield(text: $text)
}
