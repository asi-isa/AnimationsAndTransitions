//
//  TypewriterText.swift
//  AnimationsAndTransitions
//
//  Created by Ali Soner Inceoglu on 03.11.26.
//

import SwiftUI

struct TypewriterText: View, Animatable {
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion
    
    var string: String
    var count = 0
    
    var animatableData: Double {
        get { Double(count) }
        set { count = Int(max(0, newValue)) }
    }
    
    
    var body: some View {
        if accessibilityReduceMotion || accessibilityVoiceOverEnabled {
            Text(string)
        } else {
            let stringToShow = String(string.prefix(count))
            ZStack {
                Text(string)
                    .hidden()
                    .overlay(Text(stringToShow), alignment: .topLeading)
            }
        }
    }
}

#Preview {
    ContentView()
}
