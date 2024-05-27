//
//  NavigationLazyView.swift
//  Pomodoro
//
//  Created by Paul Erny on 24/05/2024.
//

// stolen from https://stackoverflow.com/a/61234030/15382205

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

//#Preview {
//    NavigationLazyView()
//}
