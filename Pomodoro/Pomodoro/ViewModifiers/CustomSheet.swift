//
//  CustomSheet.swift
//  Pomodoro
//
//  Created by Paul Erny on 07/03/2024.
//

import Foundation
import SwiftUI

struct CustomSheet<Sheet: View>: ViewModifier {
    
    @Binding var isShowing: Bool
    @ViewBuilder var sheet: Sheet
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            
            content
            
            if isShowing {
                Color.black
                    .opacity(isShowing ? 0.40 : 0)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }

                sheet
                    .transition(.move(edge: .bottom))
                    .cornerRadius(16, corner: [.topLeft, .topRight])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

extension View {
    func customSheet<Sheet: View>(_ isShowing: Binding<Bool>, @ViewBuilder _ sheet: () -> Sheet) -> some View {
        modifier(CustomSheet(isShowing: isShowing, sheet: sheet))
    }
}
