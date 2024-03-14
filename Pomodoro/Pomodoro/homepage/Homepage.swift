//
//  Homepage.swift
//  Pomodoro
//
//  Created by Paul Erny on 04/03/2024.
//

import SwiftUI

//struct Homepage: View {
//    var body: some View {
//        VStack(spacing: 82) {
//            HStack {
//                Text("MES\nPROJETS")
//                    .style(.title)
//                .multilineTextAlignment(.leading)
//                Spacer()
//            }
//            .padding([.top, .leading], 45)
//            .ignoresSafeArea()
//            VStack(alignment: .leading, spacing: 82) {
//                Image("Tumbleweed")
//                    .renderingMode(.template)
//                    .foregroundColor(Color.cardBackground)
//                Text("Créez\nvotre\npremier\nprojet")
//                    .style(.titleAlternate)
//                .multilineTextAlignment(.leading)
//            }
//            .padding(.top, 54)
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.title)
//                .frame(width: 66, height: 66)
//                .shadow(color: Color("testBtnShadow"), radius: 0, x: -3, y: 4)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//        .background(Color.background)
//        .ignoresSafeArea()
//    }
//}

struct Homepage: View {
    @EnvironmentObject var store: ProjectStorage
    
    var body: some View {
        ZStack {
            VStack(spacing: 45) {
                Text("MES\nPROJETS")
                    .style(.title)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading], 45)

                VStack {
//                    ForEach(ProjectModel.debugSample, id: \.id) { project in
//                        ProjectCard(projectName: project.name)
//                    }
                    ForEach(store.projects, id: \.id) { project in
                        ProjectCard(projectName: project.name)
                    }
                }
                .blurScroll(10)
            }
            
            VStack {
                Spacer()
                AddProjectButton()
            }
        }
        .background(Color.background)
        .ignoresSafeArea()
    }
}

struct homepage_Previews: PreviewProvider {
    @StateObject static var store = ProjectStorage()

    static var previews: some View {
        Homepage()
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
            .environmentObject(store)
    }
}
