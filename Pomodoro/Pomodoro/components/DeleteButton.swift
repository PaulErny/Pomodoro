//
//  DeleteButton.swift
//  Pomodoro
//
//  Created by Paul Erny on 28/05/2024.
//

import SwiftUI

struct DeleteButton: View {
    var onDelete: (() -> Void)?
    @State private var showingConfirmation: Bool = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            showingConfirmation = true
        } label: {
            Text("Supprimer")
                .font(.labelFont)  // TODO: .style()
                .foregroundColor(.red) // TODO: .red
            .frame(maxWidth: .infinity, minHeight: 44)
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color.cardBackground)
                    .shadow(color: Color.red.opacity(0.3), radius: 0, x: -3, y: 4) // TODO: .red
            )
            .padding([.leading, .trailing], 7)
        }
        .alert("Supprimer la tâche", isPresented: $showingConfirmation) {
                Button("Oui", role: .destructive) {
                    onDelete?()
                    dismiss()
                }
        } message: {
            Text("Etes vous sûr ?")
        }
    }
}

#Preview {
    DeleteButton(onDelete: {print("onDelete")})
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
}
