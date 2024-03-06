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
    var body: some View {
        VStack(spacing: 45) {
            HStack {
                Text("MES\nPROJETS")
                    .style(.title)
                .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding([.top, .leading], 45)
            .ignoresSafeArea()
            
            ScrollView {
                ProjectCard()
                ProjectCard()
                ProjectCard()
                ProjectCard()
                ProjectCard()
                ProjectCard()
                ProjectCard()
                ProjectCard()
                ProjectCard()
                ProjectCard()
            }
            .frame(maxHeight: 525)

            ZStack {
                Rectangle()
//                    .frame(minWidth: .infinity, maxHeight: 60)
                AddProjectButton()
            }
            .frame(maxWidth: .infinity, maxHeight: 96)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.background)
        .ignoresSafeArea()
    }
}


struct homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
