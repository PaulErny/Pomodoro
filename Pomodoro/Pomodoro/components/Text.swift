//
//  Text.swift
//  Pomodoro
//
//  Created by Paul Erny on 04/03/2024.
//

import SwiftUI

protocol TextStyle {}

struct Title: TextStyle, ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.titleFont)
            .foregroundColor(.title)
    }
}

extension ViewModifier where Self == Title {
    static var title: Title { Title() }
}

struct TitleAlternate: TextStyle, ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.titleAlternateFont)
            .foregroundColor(.title)
    }
}

extension ViewModifier where Self == TitleAlternate {
    static var titleAlternate: TitleAlternate { TitleAlternate() }
}

extension Text {
    func style<Style: ViewModifier>(_ style: Style) -> some View {
        modifier(style)
    }
}
