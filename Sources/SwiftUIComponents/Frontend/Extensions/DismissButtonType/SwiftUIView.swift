//
//  DismissButtonType+ToolbarItemPlacement.swift
//  swift-ui-components
//
//  Created by Damian Van de Kauter on 02/11/2026.
//

import SwiftUI

package extension DismissButtonType {
    
    var placement: ToolbarItemPlacement {
        switch self {
        case .done: .confirmationAction
        case .cancel: .cancellationAction
        case .close: .cancellationAction
        case .save: .cancellationAction
        }
    }
}
