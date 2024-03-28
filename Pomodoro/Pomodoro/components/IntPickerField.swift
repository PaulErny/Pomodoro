//
//  IntPickerField.swift
//  Pomodoro
//
//  Created by Paul Erny on 28/03/2024.
//

import SwiftUI

struct IntPickerField: View {
    @Binding var value: Int
    var range = 1...10
    @State var isShowingPicker: Bool = false
    
    var body: some View {
        Button(action: {
            isShowingPicker = true
        }) {
            Text(String(value))
                .style(.accentLabel)
                .frame(width: 78, height: 40)
                .background(Color.inputBackground)
                .cornerRadius(7)
                .shadow(color: Color.statCardShadow, radius: 0, x: -1, y: 2)
        }
        .popover(isPresented: $isShowingPicker) {
            Picker("value", selection: $value) {
                ForEach(range, id: \.self) { value in
                    Text(String(value))
                    .tag(value)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .clipped()
                .frame(width: 220, height: 220)
                .background(Color.cardBackground.cornerRadius(10) )
                .shadow(radius: 10)
                .presentationCompactAdaptation(.popover)
        }
    }
}

#Preview {
    @State var value: Int = 0

    return IntPickerField(value: $value)
}
