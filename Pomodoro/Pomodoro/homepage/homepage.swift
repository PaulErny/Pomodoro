//
//  homepage.swift
//  Pomodoro
//
//  Created by Paul Erny on 04/03/2024.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("MES\nPROJETS")
                    .style(.title)
                .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.leading, 45)
            .padding(.top, 45)
            Spacer()
                .frame(height: 82)
            VStack(alignment: .leading, spacing: 0) {
                Image("Tumbleweed")
                Spacer()
                    .frame(height: 82)
                Text("Créez\nvotre\npremier\nprojet")
                    .style(.titleAlternate)
                .multilineTextAlignment(.leading)
            }
            Spacer()
                .frame(height: 82)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.title)
                .frame(width: 66, height: 66)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .ignoresSafeArea()
    }
}

struct homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
