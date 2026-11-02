import SwiftUI
import Testing
@testable import SwiftUIComponents

struct DismissButtonTypeSwiftUIViewTests {
    @Test func cancellationPlacement() {
        for buttonType in [DismissButtonType.cancel, .close, .save] {
            // SwiftUI's placement type does not expose Equatable conformance.
            #expect(String(reflecting: buttonType.placement) == String(reflecting: ToolbarItemPlacement.cancellationAction))
        }
    }

    @Test func confirmationPlacement() {
        #expect(String(reflecting: DismissButtonType.done.placement) == String(reflecting: ToolbarItemPlacement.confirmationAction))
        #expect(String(reflecting: DismissButtonType.done.placement) != String(reflecting: ToolbarItemPlacement.cancellationAction))
    }
}
