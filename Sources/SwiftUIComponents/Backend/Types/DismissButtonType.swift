//
//  DismissButtonType.swift
//  swift-ui-components
//
//  Created by Damian Van de Kauter on 02/11/2026.
//

import Foundation

public enum DismissButtonType {
    
    case cancel
    case close
    case done
    case save
}

extension DismissButtonType {
    
    public var title: String {
        switch self {
        case .cancel: String(localized: "Cancel", table: "DismissToolbar", bundle: .module)
        case .close: String(localized: "Close", table: "DismissToolbar", bundle: .module)
        case .done: String(localized: "Done", table: "DismissToolbar", bundle: .module)
        case .save: String(localized: "Save", table: "DismissToolbar", bundle: .module)
        }
    }
}
