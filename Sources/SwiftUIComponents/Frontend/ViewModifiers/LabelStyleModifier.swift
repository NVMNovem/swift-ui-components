//
//  LabelStyleModifier.swift
//  swift-ui-components
//
//  Created by Damian Van de Kauter on 02/11/2026.
//

import SwiftUI

fileprivate struct LabelStyleModifier: ViewModifier {
    let isDesktopInterface: Bool
    
    func body(content: Content) -> some View {
        if isDesktopInterface {
            content
                .labelStyle(.titleOnly)
        } else {
            content
                .labelStyle(.iconOnly)
        }
    }
}

package extension View {
    
    func labelStyle(isDesktopInterface: Bool) -> some View {
        modifier(LabelStyleModifier(isDesktopInterface: isDesktopInterface))
    }
}
