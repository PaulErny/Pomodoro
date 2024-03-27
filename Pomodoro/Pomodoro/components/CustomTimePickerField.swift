//
//  CustomTimePickerField.swift
//  Pomodoro
//
//  Created by Paul Erny on 27/03/2024.
//

import SwiftUI

class Time: ObservableObject {
    @Published var hours: Int
    @Published var minutes: Int
    
    var inMinutes: Int {
        hours * 60 + minutes
    }
    
    init(hours: Int, minutes: Int) {
        self.hours = hours
        self.minutes = minutes
    }
}

struct CustomTimePickerField: View {
    @ObservedObject var time: Time
    @State var isShowingPicker: Bool = false
    
    var body: some View {
        Button(action: {
            isShowingPicker = true
        }) {
            Text(formatTime())
                .style(.accentLabel)
                .frame(width: 78, height: 40)
                .background(Color.inputBackground)
                .cornerRadius(7)
                .shadow(color: Color.statCardShadow, radius: 0, x: -1, y: 2)
        }
        .popover(isPresented: $isShowingPicker) {
            CustomTimePicker(selection: time)
                .frame(width: 220, height: 220)
                .background(Color.cardBackground.cornerRadius(10) )
                .shadow(radius: 10)
                .presentationCompactAdaptation(.popover)
        }
    }
    
    private func formatTime() -> String {
        let hours = time.hours < 10 ? "0\(time.hours)" : "\(time.hours)"
        let minutes = time.minutes < 10 ? "0\(time.minutes)" : "\(time.minutes)"
        return "\(hours):\(minutes)"
    }
}

#Preview {
    @ObservedObject var time = Time(hours: 1, minutes: 45)
    
    return CustomTimePickerField(time: time)
}
