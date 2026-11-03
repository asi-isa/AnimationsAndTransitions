//
//  AnimatableFont.swift
//  AnimationsAndTransitions
//
//  Created by Ali Soner Inceoglu on 03.11.26.
//

import SwiftUI

struct AnimatableFontModifier: ViewModifier, Animatable {
    var size: Double
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
    }
}

extension View {
    func animatableFont(_ size: Double) -> some View {
        self.modifier(AnimatableFontModifier(size: size))
    }
}


struct AnimatableFont: View {
    @State private var scaleUp = false
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .animatableFont(scaleUp ? 56 : 24)
            
            Button("Animate") {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
                    scaleUp.toggle()
                }
            }
        }
        .frame(width: 400, height: 500)
    }
}

#Preview {
    AnimatableFont()
}
