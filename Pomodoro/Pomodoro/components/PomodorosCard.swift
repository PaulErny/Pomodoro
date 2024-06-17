//
//  PomodorosCard.swift
//  Pomodoro
//
//  Created by Paul Erny on 27/05/2024.
//

import SwiftUI

struct PomodorosCard: View {
    @Binding var pomodorosCount: Int
    @State var isShowingPicker: Bool = false
    var range = 1...99

    var body: some View {
        Button {} label: {
            HStack(spacing: 0) {
                Text(getLabel())
                    .style(.label)
                .padding(.leading, 30)
                
                Spacer()
                
                Text(String(pomodorosCount))
                    .font(.labelFont) // tmp
                    .foregroundColor(.title) // tmp
                    .frame(width: 70)
                    .padding([.top, .bottom], 6)
                    .background(
                        RoundedRectangle(cornerRadius: 7)
                            .fill(Color.cardBackground)
                            .overlay(
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(
                                        .shadow(.inner(color: .black.opacity(0.12), radius: 4 ))
                                    )
                                    .padding(2)
                                    .foregroundStyle(Color.inputBackground)
                            )
                    )
                    .padding(.trailing, 13)
            }
            .frame(minHeight: 44)
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color.cardBackground)
                    .shadow(color: Color.cardShadow, radius: 0, x: -3, y: 4)
            )
            .padding([.leading, .trailing], 7)
            .popover(isPresented: $isShowingPicker) {
                Picker("value", selection: $pomodorosCount) {
                    ForEach(range, id: \.self) { value in
                        Text(String(value))
                        .tag(value)
                    }
                }
                .onSubmit {
//                    onComplete?(value)
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
    
    private func getLabel() -> String {
        return "Pomodoro" + (pomodorosCount > 1 ? "s" : "")
    }
}

#Preview {
    @State var pomodorosCount: Int = 1
    
    return PomodorosCard(pomodorosCount: $pomodorosCount)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
}
