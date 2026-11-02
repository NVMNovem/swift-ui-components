import Foundation
import Testing
@testable import SwiftUIComponents

struct DismissButtonTypeTests {
    @Test func titles() {
        let cases: [(DismissButtonType, String)] = [
            (.cancel, "Cancel"),
            (.close, "Close"),
            (.done, "Done"),
            (.save, "Save"),
        ]

        for (buttonType, localizationKey) in cases {
            let expectedTitle = String(localized: String.LocalizationValue(localizationKey), table: "DismissToolbar")
            #expect(buttonType.title == expectedTitle)
        }
    }
}
