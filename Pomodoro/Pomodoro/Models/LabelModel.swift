//
//  LabelModel.swift
//  Pomodoro
//
//  Created by Paul Erny on 19/03/2024.
//

import Foundation
import SwiftUI

struct LabelModel: Identifiable, Codable, Equatable {
    static func == (lhs: LabelModel, rhs: LabelModel) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.color == rhs.color
    }
    
    var id: UUID
    var name: String
    var color: Color

    init(id: UUID = UUID(), name: String, color: Color) {
        self.id = id
        self.name = name
        self.color = color
    }
}
