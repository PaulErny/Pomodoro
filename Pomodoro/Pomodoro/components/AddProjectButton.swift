//
//  AddProjectButton.swift
//  Pomodoro
//
//  Created by Paul Erny on 06/03/2024.
//

import SwiftUI

struct AddProjectButton: View {
    @State private var showingSheet = false
    
    var body: some View {

        Button {
            showingSheet.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.title)
                    .frame(width: 66, height: 66)
                    .shadow(color: Color("testBtnShadow"), radius: 0, x: -4, y: 5)
                Image(systemName: "plus")
                    .font(.system(size: 62))
                    .foregroundColor(.background)
            }
        }
        .padding(.bottom, 27)
        .customSheet($showingSheet) {
            VStack {
                Text("tmp")
            }
            .frame(maxWidth: .infinity, maxHeight: 250)
            .background(Color.cardBackground)
        }
    }
}

struct AddProjectButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            AddProjectButton()
        }
        .background(Color.background)
    }
}
