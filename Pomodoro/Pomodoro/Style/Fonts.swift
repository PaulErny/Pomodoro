//
//  Styles.swift
//  Pomodoro
//
//  Created by Paul Erny on 04/03/2024.
//

import Foundation
import SwiftUI

extension Font {
    enum Manrope {
        case semibold
        case custom(String)
        
        var value: String  {
            switch self {
            case .semibold:
                return "SemiBold"
            case .custom(let type):
                return type
            }
        }
    }
    
    enum Montserrat {
        case semibold
        case bold
        case custom(String)
        
        var value: String {
            switch self {
            case .semibold:
                return "SemiBold"
            case .bold:
                return "Bold"
            case .custom(let type):
                return type
            }
        }
    }

    static func manrope(_ type: Manrope, size: CGFloat = 20) -> Font {
        return .custom("Manrope-" + type.value, size: size)
    }
    
    static var labelFont: Font {
        .manrope(.semibold, size: 20)
    }

    static var sublabelFont: Font {
        .manrope(.semibold, size: 12)
    }

    static func montserrat(_ type: Montserrat, size: CGFloat = 36) -> Font {
        return .custom("Montserrat-" + type.value, size: size)
    }

    static var titleFont: Font {
        .montserrat(.semibold, size: 36)
    }

    static var titleAlternateFont: Font {
        .montserrat(.bold, size: 32)
    }
}
