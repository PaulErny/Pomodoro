//
//  CornerRadius.swift
//  Pomodoro
//
//  Created by Paul Erny on 07/03/2024.
//

import Foundation
import SwiftUI

// https://stackoverflow.com/a/58606176

struct CornerRadius: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corner: UIRectCorner) -> some View {
        clipShape( CornerRadius(radius: radius, corners: corner) )
    }
}
