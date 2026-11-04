//
//  withMotionAnimation.swift
//  AnimationsAndTransitions
//
//  Created by Ali Soner Inceoglu on 04.11.26.
//

import SwiftUI

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

func withMotionAnimation<Result>(
    _ animation: Animation? = .default,
    _ body: () throws -> Result
) rethrows -> Result {

    #if os(macOS)
    let reduceMotion = NSWorkspace.shared.accessibilityDisplayShouldReduceMotion
    #elseif os(iOS)
    let reduceMotion = UIAccessibility.isReduceMotionEnabled
    #endif

    if reduceMotion {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}
