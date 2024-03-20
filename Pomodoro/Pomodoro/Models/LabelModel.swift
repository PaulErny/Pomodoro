//
//  LabelModel.swift
//  Pomodoro
//
//  Created by Paul Erny on 19/03/2024.
//

import Foundation
import SwiftUI

struct LabelModel: Identifiable, Codable, Equatable, Hashable {
    var id: UUID
    var name: String
    var color: Color

    init(id: UUID = UUID(), name: String, color: Color) {
        self.id = id
        self.name = name
        self.color = color
    }
}
