import Testing
@testable import SwiftUIComponents

@MainActor
struct DismissToolbarTests {
    @Test func customActionRunsOncePerInvocation() {
        for buttonType in [DismissButtonType.cancel, .close, .done, .save] {
            var invocationCount = 0
            let toolbar = DismissToolbar(buttonType) {
                invocationCount += 1
            }

            #expect(invocationCount == 0)
            toolbar.buttonAction()
            #expect(invocationCount == 1)
            toolbar.buttonAction()
            #expect(invocationCount == 2)
        }
    }

    @Test func defaultButtonTypeSupportsCustomAction() {
        var didRunAction = false
        let toolbar = DismissToolbar {
            didRunAction = true
        }

        toolbar.buttonAction()

        #expect(didRunAction)
    }
}
