//
//  ProjectCard.swift
//  Pomodoro
//
//  Created by Paul Erny on 04/03/2024.
//

import SwiftUI

struct ProjectCard: View {
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("projet 1")
                    .style(.label)
                    .padding(.leading, 30)
                    .padding(.top, 7)

                Spacer()
                
                HStack(spacing: 28) {
                    HStack(spacing: 5) {
                        Image("List")
                        Text("tâches: 3")
                            .style(.sublabel)
                    }
                    HStack(spacing: 5) {
                        Image("Clock")
                        Text("durée: 55 minutes")
                            .style(.sublabel)
                    }
                    Spacer()
                }
                .padding(.leading, 30)
                .padding(.bottom, 7)
            }
            Image(systemName: "chevron.right")
                .foregroundColor(.label)
                .imageScale(.large)
                .padding(.trailing, 15)
        }
        .frame(maxWidth: .infinity, maxHeight: 66, alignment: .top)
        .background {
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.cardBackground)
                .shadow(color: Color("testShadow"), radius: 0, x: -3, y: 4)
        }
        .padding([.leading, .trailing], 15)
    }
}

struct ProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            ProjectCard()
            Spacer()
        }
            .background(Color.background)
    }
}
