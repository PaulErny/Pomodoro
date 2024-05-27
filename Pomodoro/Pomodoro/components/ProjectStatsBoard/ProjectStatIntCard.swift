//
//  ProjectStatIntCard.swift
//  Pomodoro
//
//  Created by Paul Erny on 29/03/2024.
//

import SwiftUI

struct ProjectStatIntCard: View {
    @Binding var value: Int
    var header: String = ""
    var footer: String = ""
    
    var body: some View {
        VStack(spacing: 3) {
            Text(header)
                .font(.lightSublabelFont)
                .foregroundStyle(Color.label)
            Text("\(value)")
                .font(.labelFont)
                .foregroundStyle(Color.cardBackground)
                .frame(width: 78, height: 40)
                .background(Color.inputBackground)
                .cornerRadius(7)
            Text(footer)
                .font(.sublabelFont)
                .foregroundStyle(Color.label)
        }
    }
}

#Preview {
    @State var counter: Int = 0
    return VStack {
        ProjectStatIntCard(value: $counter, header: "header", footer: "counter")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}
