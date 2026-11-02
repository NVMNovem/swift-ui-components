//
//  DismissButtonType.swift
//  swift-ui-components
//
//  Created by Damian Van de Kauter on 02/11/2026.
//

public enum DismissButtonType {
    
    case cancel
    case close
    case done
    case save
}

extension DismissButtonType {
    
    public var title: String {
        switch self {
        case .cancel: String(localized: "Cancel", table: "DismissToolbar")
        case .close: String(localized: "Close", table: "DismissToolbar")
        case .done: String(localized: "Done", table: "DismissToolbar")
        case .save: String(localized: "Save", table: "DismissToolbar")
        }
    }
}
