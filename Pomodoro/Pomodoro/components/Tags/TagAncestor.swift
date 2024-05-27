//
//  TagAncestor.swift
//  Pomodoro
//
//  Created by Paul Erny on 27/05/2024.
//

import SwiftUI

struct TagAncestor: View {
    var tag: LabelModel
    
    var body: some View {
        Text(tag.name)
            .frame(height: 14)
            .padding([.leading, .trailing], 7)
            .padding([.bottom, .top], 3)
            .font(.body)// TODO: font
    }
}

#Preview {
    TagAncestor(tag: LabelModel(name: "test", color: .red))
}
