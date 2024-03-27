//
//  ProjectStatClickableTimeCard.swift
//  Pomodoro
//
//  Created by Paul Erny on 20/03/2024.
//

import SwiftUI

struct ProjectStatClickableTimeCard: View {
    var components = DateComponents(minute: 25)
    var onChange: (() -> Void)?

    @ObservedObject var time: Time

    var body: some View {
        VStack(spacing: 3) {
            Text("durée")
                .font(.lightSublabelFont)
                .foregroundStyle(Color.label)
            CustomTimePickerField(time: time)
            Text("Pomodoro")
                .font(.sublabelFont)
                .foregroundStyle(Color.label)
        }
    }
}

#Preview {
    @ObservedObject var time = Time(hours: 0, minutes: 25)
    
    return VStack {
        ProjectStatClickableTimeCard(time: time)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}
