//
//  BlurScroll.swift
//  Pomodoro
//
//  Created by Paul Erny on 06/03/2024.
//

import Foundation
import SwiftUI

private struct BlurScroll: ViewModifier {
    
    let blur: CGFloat
    let coordinateSpaceName = "scroll"
    
    @State private var scrollPosition: CGPoint = .zero
    
    func body(content: Content) -> some View {
        
        let gradient = LinearGradient(stops: [
            .init(color: .background, location: 0.10),
            .init(color: .clear, location: 0.25)],
                                      startPoint: .bottom,
                                      endPoint: .top)
        
        let invertedGradient = LinearGradient(stops: [
            .init(color: .clear, location: 0.10),
            .init(color: .background, location: 0.25)],
                                              startPoint: .bottom,
                                              endPoint: .top)
        
        GeometryReader { topGeo in
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top) {
                    content
                        .mask(
                            VStack {
                                invertedGradient
                                    .frame(height: topGeo.size.height, alignment: .top)
                                    .offset(y:  -scrollPosition.y )
                                Spacer()
                            }
                        )
                        .allowsHitTesting(true)
                    
                    content
                        .blur(radius: blur)
                        .frame(height: topGeo.size.height, alignment: .top)
                        .mask(gradient
                            .frame(height: topGeo.size.height)
                            .offset(y:  -scrollPosition.y )
                        )
                        .ignoresSafeArea()
                        .allowsHitTesting(false)
                }
                .padding(.bottom, topGeo.size.height * 0.25)
                .background(GeometryReader { geo in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self,
                                    value: geo.frame(in: .named(coordinateSpaceName)).origin)
                })
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    self.scrollPosition = value
                }
            }
            .coordinateSpace(name: coordinateSpaceName)
        }
        .ignoresSafeArea()
    }
}

//MARK: PreferenceKey
private struct ScrollOffsetPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) { }
}

extension View {
    func blurScroll(_ blur: CGFloat) -> some View {
        modifier(BlurScroll(blur: blur))
    }
}
