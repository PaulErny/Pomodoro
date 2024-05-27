//
//  NewTag.swift
//  Pomodoro
//
//  Created by Paul Erny on 27/05/2024.
//

import SwiftUI

struct NewTag: View {
    private let tag = LabelModel(name: "+ Nouvelle étiquette", color: .title)
    
    var body: some View {
        TagAncestor(tag: tag)
            .foregroundColor(tag.color)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .fill(tag.color)
            )
    }
}

#Preview {
    NewTag()
}
