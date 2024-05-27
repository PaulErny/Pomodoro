//
//  ProjectStatClickableTimeCard.swift
//  Pomodoro
//
//  Created by Paul Erny on 20/03/2024.
//

import SwiftUI

struct ProjectStatClickableTimeCard: View {
    var components = DateComponents(minute: 25)

    @Binding var time: Time
    var header: String = ""
    var footer: String = ""

    var body: some View {
        VStack(spacing: 3) {
            Text(header)
                .font(.lightSublabelFont)
                .foregroundStyle(Color.label)
            CustomTimePickerField(time: $time)
            Text(footer)
                .font(.sublabelFont)
                .foregroundStyle(Color.label)
        }
    }
}

#Preview {
    @State var time = Time(hours: 0, minutes: 25)
    
    return VStack {
        ProjectStatClickableTimeCard(time: $time)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}
