//
//  ConfettiModifier.swift
//  AnimationsAndTransitions
//
//  Created by Ali Soner Inceoglu on 04.11.26.
//

import SwiftUI

struct ConfettiModifier<T: ShapeStyle>: ViewModifier {
    @State private var circleSize = 0.00001
    @State private var strokeMultiplier = 1.0
    @State private var confettiIsHidden = true
    @State private var confettiMovement = 0.7
    @State private var confettiScale = 1.0
    @State private var contentsScale = 0.00001
    private let speed = 0.3
    var color: T
    var size: Double
    
    func body(content: Content) -> some View {
        content
            .hidden()
            .padding(10)
            .overlay {
                ZStack {
                    GeometryReader { geo in
                        Circle()
                            .strokeBorder(color, lineWidth: geo.size.width / 2 * strokeMultiplier)
                            .scaleEffect(circleSize)
                        
                        ForEach(0..<15) { i in
                            Circle()
                            .fill(color)
                            .frame(width: size + sin(Double(i)), height: size + sin(Double(i)))
                            .scaleEffect(confettiScale)
                            .offset(x: geo.size.width / 2 * confettiMovement + (i.isMultiple(of: 2) ? size : 0))
                            .rotationEffect(.degrees(24 * Double(i)))
                            .offset(x: (geo.size.width - size) / 2, y: (geo.size.height - size) / 2)
                            .opacity(confettiIsHidden ? 0 : 1)
                        }
                    }
                    
                    content
                        .scaleEffect(contentsScale)
                }
            }
            .padding(-10)
            .onAppear {
                withAnimation(.smooth.speed(speed )) {
                    circleSize = 1
                }
                withAnimation(.smooth.speed(speed ).delay(speed)) {
                    strokeMultiplier = 0.00001
                }
                withAnimation(.interpolatingSpring(stiffness: 50, damping: 5).delay(speed)) {
                    contentsScale = 1
                }
                withAnimation(.easeOut(duration: speed).delay(speed * 1.25)) {
                    confettiIsHidden = false
                    confettiMovement = 1.2
                }
                withAnimation(.easeOut(duration: speed).delay(speed * 2)) {
                    confettiScale = 0.00001
                }
            }
    }
}

extension AnyTransition{
    static var confetti: AnyTransition {
        self
            .modifier(
                active: ConfettiModifier(color: .blue, size: 3),
                identity: ConfettiModifier(color: .blue, size: 3)
            )
    }
    
    static func confetti<T: ShapeStyle>(color: T = .blue, size: Double = 3.0) -> AnyTransition {
        AnyTransition
            .modifier(
                active: ConfettiModifier(color: color, size: size),
                identity: ConfettiModifier(color: color, size: size)
            )
    }
}

