//
//  CountingText.swift
//  AnimationsAndTransitions
//
//  Created by Ali Soner Inceoglu on 03.11.26.
//

import SwiftUI

struct CountingText: View, Animatable {
    var value: Double
    var fractionLength = 8
    
    var animatableData: Double {
        get { value }
        set { value = newValue }
    }
    
    var body: some View {
        Text(value.formatted(.number.precision(.fractionLength(fractionLength))))
    }
}
