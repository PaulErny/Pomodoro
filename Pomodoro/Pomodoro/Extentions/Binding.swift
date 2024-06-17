//
//  Binding.swift
//  Pomodoro
//
//  Created by Paul Erny on 31/05/2024.
//

import Foundation
import SwiftUI

// needed to prevent certain navigationLinks from freezing the app when giving bindings as destination params
extension Binding: Equatable where Value: Equatable {
    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}


extension Binding: Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.wrappedValue.hashValue)
    }
}
