//
//  ProjectStatsBoard.swift
//  Pomodoro
//
//  Created by Paul Erny on 20/03/2024.
//

import SwiftUI

struct ProjectStatsBoard: View {
    @EnvironmentObject var store: ProjectStorage
    @Binding var project: ProjectModel
    
//    @ObservedObject var pomodoroLength = Time(hours: 0, minutes: 25)
//    @ObservedObject var smallBreakLength = Time(hours: 0, minutes: 5)
//    @ObservedObject var longBreakLength = Time(hours: 0, minutes: 15)
//    @State var pomodorosBeforeBreak: Int = 4
    
    @State var testTimer = 100
    @State var testCounter = 0

    @ViewBuilder private var pomodorosBeforeBreakField: some View {
        VStack(spacing: 3) {
            Text("longue pause")
                .font(.lightSublabelFont)
                .foregroundStyle(Color.label)
            ZStack(alignment: .top) {
                IntPickerField(value: $project.pomodorosBeforeBreak, onComplete: { newValue in
//                    store.saveTest(for: project.id, value: newValue)
                })
                Text("tous les")
                    .font(.lightSublabelFont)
                    .foregroundStyle(Color.label)
            }
            Text("Pomodoro")
                .font(.sublabelFont)
                .foregroundStyle(Color.label)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ProjectStatClickableTimeCard(time: $project.pomodoroLength, header: "durée", footer: "Pomodoro")
                ProjectStatClickableTimeCard(time: $project.smallBreakLength, header: "durée", footer: "Pause")
                pomodorosBeforeBreakField
                ProjectStatClickableTimeCard(time: $project.longBreakLength, header: "durée", footer: "Longue pause")
            }
            Rectangle()
                .fill(Color.label)
                .frame(height: 2)
                .padding([.leading, .trailing], 18)
            HStack {
                ProjectStatTimerCard(minutes: $testTimer, header: "durée", footer: "Restante")
                ProjectStatIntCard(value: $testCounter, header: "tâches", footer: "Terminées")
                ProjectStatTimerCard(minutes: $testTimer, header: "temps", footer: "Total passé")
                ProjectStatIntCard(value: $testCounter, header: "total", footer: "Pomodoros")
            }
        }
        .frame(height: 180)
        .frame(maxWidth: .infinity)
        .background(Color.cardBackground)
        .cornerRadius(7)
        .padding([.leading, .trailing], 7)
    }
}

#Preview {
    @State var project = ProjectModel.fullDebugProject
    
    return VStack {
        ProjectStatsBoard(project: $project)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
}
