//
//  ProjectStatTimerCard.swift
//  Pomodoro
//
//  Created by Paul Erny on 20/03/2024.
//

import SwiftUI

struct ProjectStatTimerCard: View {
    enum clockType {
    case increasing, decreasing
    }

    var type: clockType = .decreasing
    @Binding var minutes: Int
    var header: String = ""
    var footer: String = ""

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private func formatTime() -> String {
        let hours = Int(minutes / 60)
        let minutes = Int(self.minutes % 60)
        
        let strHours = hours < 10 ? "0\(hours)" : "\(hours)"
        let strMinutes = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        
        return strHours + ":" + strMinutes
    }
    
    var body: some View {
        VStack(spacing: 3) {
            Text(header)
                .font(.lightSublabelFont)
                .foregroundStyle(Color.label)
            Text(formatTime())
                .font(.labelFont)
                .foregroundStyle(Color.cardBackground)
                .frame(width: 78, height: 40)
                .background(Color.inputBackground)
                .cornerRadius(7)
            Text(footer)
                .font(.sublabelFont)
                .foregroundStyle(Color.label)
        }
        .onReceive(timer) { _ in
            if type == .decreasing && minutes > 0 {
                minutes -= 1
            } else if type == .increasing {
                minutes += 1
            }
        }
    }
}


struct ProjectStatTimerCard_Previews: PreviewProvider {
    @State static var decr = 100
    @State static var incr = 0

    static var previews: some View {
        VStack {
            ProjectStatTimerCard(minutes: $decr, header: "header", footer: "decreasing")
            ProjectStatTimerCard(type: .increasing, minutes: $incr, header: "header", footer: "increasing")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}
