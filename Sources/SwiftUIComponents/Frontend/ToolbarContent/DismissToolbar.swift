//
//  DismissToolbar.swift
//  swift-ui-components
//
//  Created by Damian Van de Kauter on 02/11/2026.
//

import SwiftUI

public struct DismissToolbar: ToolbarContent {
    
    private let dismissButtonType: DismissButtonType
    private let action: (() -> Void)?
    
    @Environment(\.dismiss) var dismiss
    
    public init(_ dismissButtonType: DismissButtonType = .done, action: @escaping @MainActor () -> Void) {
        self.dismissButtonType = dismissButtonType
        self.action = action
    }
    
    public init(_ dismissButtonType: DismissButtonType = .done) {
        self.dismissButtonType = dismissButtonType
        self.action = nil
    }
    
    public var body: some ToolbarContent {
        ToolbarItem(placement: dismissButtonType.placement) {
            switch dismissButtonType {
            case .cancel:
                Button(role: .cancel) {
                    buttonAction()
                } label: {
                    Label {
                        Text(dismissButtonType.title)
                    } icon: {
                        Image(systemName: "xmark")
                    }
                    .labelStyle(.titleOnly)
                }
                .keyboardShortcut(.cancelAction)
            case .close:
                Button {
                    buttonAction()
                } label: {
                    Label {
                        Text(dismissButtonType.title)
                    } icon: {
                        Image(systemName: "xmark")
                    }
                    .labelStyle(isDesktopInterface: isDesktopInterface)
                }
                .keyboardShortcut(.escape)
            case .done:
                Button {
                    buttonAction()
                } label: {
                    Label {
                        Text(dismissButtonType.title)
                    } icon: {
                        Image(systemName: "checkmark")
                    }
                    .labelStyle(.titleOnly)
                }
                .tint(Color.accentColor)
                .buttonStyle(.borderedProminent)
            case .save:
                Button {
                    buttonAction()
                } label: {
                    Label {
                        Text(dismissButtonType.title)
                    } icon: {
                        Image(systemName: "checkmark")
                    }
                    .labelStyle(isDesktopInterface: isDesktopInterface)
                }
                .tint(Color.accentColor)
                .buttonStyle(.borderedProminent)
                .keyboardShortcut(.defaultAction)
            }
        }
    }
    
    private var isDesktopInterface: Bool {
        #if os(macOS)
        return true
        #else
        return false
        #endif
    }
    
    private func buttonAction() {
        if let action {
            action()
        } else {
            dismiss()
        }
    }
}
