//
//  TaskMain.swift
//  Pomodoro
//
//  Created by Paul Erny on 27/05/2024.
//

import SwiftUI

struct TaskMain: View {
    let name: String
    let isComplete: Bool
    private let doneImage = Image("done")
    private let playImage = Image("play")
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(name)
                    .style(.label)
                    .padding(.top, 7)
                newLabelButton()
                    .padding(.bottom, 5)
            }
            .padding(.leading, 30)
            
            Spacer()
            
            getRightImage()
        }
        .background(
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.cardBackground)
                .shadow(color: Color.cardShadow, radius: 0, x: -3, y: 4)
        )
        .padding([.leading, .trailing], 7)
    }
    
    func getRightImage() -> some View {
        isComplete ? doneImage.padding(.trailing, 13) : playImage.padding(.trailing, 13)
    }
    
    func newLabelButton() -> some View {
        return TagsCollectionView(tags: []) {
            NewTag()
        } // TODO: make clickable
    }
}

#Preview {
    let isComplete = true
    let name = "test task"
    
    return TaskMain(name: name, isComplete: isComplete)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
}
