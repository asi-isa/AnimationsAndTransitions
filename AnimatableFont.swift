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
    func animatbleFont(_ size: Double) -> some View {
        self.modifier(AnimatableFontModifier(size: size))
    }
}


struct AnimatableFont
