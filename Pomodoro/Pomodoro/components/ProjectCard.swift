//
//  ProjectCard.swift
//  Pomodoro
//
//  Created by Paul Erny on 04/03/2024.
//

import SwiftUI

struct ProjectCard: View {
    var projectName: String
    @State private var dragOffset = CGSize.zero
    private let cardHeight: CGFloat = 66
    @State private var isRemoved = false
    @State private var isRemovingMode = false
    var onDelete: (() -> Void)?

    var body: some View {

        ZStack {
            GeometryReader { geo in
                if !isRemoved && dragOffset != .zero {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(Color.red)
                        .overlay(alignment: .trailing) {
                            if !isRemoved {
                                Image(systemName: "trash")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFit()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(.cardBackground)
                                    .padding(.trailing, 20)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.15)) {
                                            onDelete?()
                                            isRemoved = true
                                            dragOffset.width = -geo.size.width - 30
                                        }
                                    }
                            }
                        }
                }
            
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(projectName)
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
                .background {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(Color.cardBackground)
                        .shadow(color: Color("testShadow"), radius: 0, x: -3, y: 4)
                        .frame(height: cardHeight)
                }
                .offset(dragOffset)
                .gesture(
                    DragGesture(minimumDistance: 20)
                        .onChanged { gesture in
                            if gesture.translation.width < 0 {
                                dragOffset.width = gesture.translation.width
                            } else if isRemovingMode && dragOffset.width < 0 {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    dragOffset = .zero
                                }
                            }
                        }
                        .onEnded { gesture in
                            if abs(gesture.translation.width) >= geo.size.width / 2 && gesture.translation.width < 0 {
                                onDelete?()
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    dragOffset.width = -geo.size.width - 30
                                    isRemoved = true
                                }
                            } else if dragOffset.width <= -cardHeight {
                                isRemovingMode = true
                                dragOffset.width = -cardHeight
                            } else {
                                isRemovingMode = false
                                dragOffset = .zero
                            }
                        }
                )
            }
        }
        .frame(height: cardHeight)
        .frame(maxWidth: .infinity, maxHeight: cardHeight, alignment: .top)
        .padding([.leading, .trailing], 15)
    }
}

struct ProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            ProjectCard(projectName: "Projet 1")
            Spacer()
        }
            .background(Color.background)
    }
}
