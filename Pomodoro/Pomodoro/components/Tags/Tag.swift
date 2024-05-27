//
//  Tag.swift
//  Pomodoro
//
//  Created by Paul Erny on 27/05/2024.
//

import SwiftUI

struct Tag: View {
    var tag: LabelModel
    
    var body: some View {
        TagAncestor(tag: tag)
            .background(tag.color)
            .foregroundColor(Color.cardBackground)
            .cornerRadius(10)
    }
}

#Preview {
    Tag(tag: LabelModel(name: "test", color: .red))
}
