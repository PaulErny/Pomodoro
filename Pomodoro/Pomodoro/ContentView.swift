//
//  ContentView.swift
//  Pomodoro
//
//  Created by Paul Erny on 01/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .font(.manrope(.semibold))
            Text("Hello, world!")
                .padding()
                .font(.montserrat(.semibold))
            Text("Hello, world!")
                .padding()
                .font(.montserrat(.bold))
            
            HStack(spacing: 30) {
                Rectangle()
                    .fill(Color.background)
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(20, antialiased: true)
                Rectangle()
                    .fill(Color.title)
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(20, antialiased: true)
                Rectangle()
                    .fill(Color.label)
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(20, antialiased: true)
            }
            .frame(height: 60)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
