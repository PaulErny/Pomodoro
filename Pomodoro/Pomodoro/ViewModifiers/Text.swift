//
//  Text.swift
//  Pomodoro
//
//  Created by Paul Erny on 04/03/2024.
//

import SwiftUI

protocol TextStyle {}

// ----------------- TITLE STYLE -----------------

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

// ----------------- TITLE BOLD STYLE -----------------

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

// ----------------- LABEL STYLE -----------------

struct Label: TextStyle, ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.labelFont)
            .foregroundColor(.label)
    }
}

extension ViewModifier where Self == Label {
    static var label: Label { Label() }
}

// ----------------- SUBLABEL STYLE -----------------

struct Sublabel: TextStyle, ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.sublabelFont)
            .foregroundColor(.sublabel)
    }
}

extension ViewModifier where Self == Sublabel {
    static var sublabel: Sublabel { Sublabel() }
}

extension Text {
    func style<Style: ViewModifier>(_ style: Style) -> some View {
        modifier(style)
    }
}
