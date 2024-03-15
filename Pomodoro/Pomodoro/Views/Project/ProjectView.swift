//
//  ProjectView.swift
//  Pomodoro
//
//  Created by Paul Erny on 15/03/2024.
//

import SwiftUI

struct ProjectView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 10) {
            //  stats
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.cardBackground)
                .frame(height: 180)
                .padding([.leading, .trailing], 7)
                .padding(.top, 10)
            
            // task creation
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.cardBackground)
                .frame(height: 44)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .fill(
                            .shadow(.inner(color: .black.opacity(0.15), radius: 4 ))
                        )
                        .padding(2)
                        .foregroundStyle(Color.inputBackground)
                    
                )
                .padding([.leading, .trailing], 7)
                
            Text("Hello, World!")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.background)
        // TODO: créer viewmodifier pour la navbar
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("test")
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

#Preview {
    NavigationStack {
        ProjectView()
    }
}
