//
//  CustomTimePicker.swift
//  Pomodoro
//
//  Created by Paul Erny on 27/03/2024.
//

import SwiftUI

struct CustomTimePicker: View {
    var data: [(String, [Int])] = [
        ("Hours", Array(0...23)),
        ("Minutes", Array(0...59))
    ]
    @ObservedObject var selection: Time

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
//                ForEach(0..<data.count, id: \.self) { column in
//                    Picker(data[column].0, selection: $selection[column]) {
//                        ForEach(0..<data[column].1.count, id: \.self) { row in
//                            Text(formatTime(data[column].1[row]))
//                            .tag(formatTime(data[column].1[row]))
//                        }
//                    }
//                    .pickerStyle(WheelPickerStyle())
//                    .frame(width: geometry.size.width / CGFloat(self.data.count), height: geometry.size.height)
//                    .clipped()
//                }
                Picker("Hours", selection: $selection.hours) {
                    ForEach(0...23, id: \.self) { hours in
                        Text(formatTime(hours))
                        .tag(formatTime(hours))
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: geometry.size.width / CGFloat(self.data.count), height: geometry.size.height)
                .clipped()
                
                Picker("Minutes", selection: $selection.minutes) {
                    ForEach(0...59, id: \.self) { minutes in
                        Text(formatTime(minutes))
                        .tag(formatTime(minutes))
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: geometry.size.width / CGFloat(self.data.count), height: geometry.size.height)
                .clipped()
            }
        }
    }
    
    func formatTime(_ time: Int) -> String {
        time < 10 ? String("0\(time)") : String(time)
    }
}

struct CustomTimePicker_Previews: PreviewProvider {
    @ObservedObject static var selection = Time(hours: 0, minutes: 0)
    
    static var previews: some View {
        VStack {
            CustomTimePicker(selection: selection)
                .frame(width: 220, height: 220)
                .background(Color.cardBackground.cornerRadius(10) )
                .shadow(radius: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}
