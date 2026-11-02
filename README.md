# SwiftUIComponents

A Swift package containing reusable SwiftUI components for Novem projects.
It currently provides `DismissToolbar` for cancel, close, done, and save actions,
with localized labels and platform-specific presentation.

## Requirements

- Swift 6.0 or later.
- iOS 15+, macOS 12+, tvOS 15+, watchOS 8+, or visionOS 1+.
- Xcode with the SDK for your target platform.

## Installation

In Xcode, choose **File > Add Package Dependencies** and enter:

```text
https://github.com/NVMNovem/swift-ui-components.git
```

Select the `main` branch to use the current code, then add the
`SwiftUIComponents` product to your app target.

For another Swift package, add this dependency to `Package.swift`:

```swift
.package(
    url: "https://github.com/NVMNovem/swift-ui-components.git",
    branch: "main"
)
```

Add the product to the consuming target's dependencies:

```swift
.product(name: "SwiftUIComponents", package: "swift-ui-components")
```

## Usage

### Dismiss a presentation

Add `DismissToolbar` to the toolbar of a presented view. Without a custom
action, it uses SwiftUI's environment dismiss action. The default button type
is `.done`.

```swift
import SwiftUI
import SwiftUIComponents

struct DetailsView: View {
    var body: some View {
        Text("Details")
            .toolbar {
                DismissToolbar(.close)
            }
    }
}
```

### Provide a custom action

A custom action replaces automatic dismissal. Save your changes and call
`dismiss()` explicitly when the presentation should close.

```swift
import SwiftUI
import SwiftUIComponents

struct EditView: View {
    @Environment(\.dismiss) private var dismiss
    let save: @MainActor () -> Void

    var body: some View {
        Text("Edit details")
            .toolbar {
                DismissToolbar(.cancel)
                DismissToolbar(.save) {
                    save()
                    dismiss()
                }
            }
    }
}
```

### Button types

| Type | Placement | Label | Keyboard shortcut |
| --- | --- | --- | --- |
| `.cancel` | Cancellation action | Title | Cancel action |
| `.close` | Cancellation action | Title on macOS; icon elsewhere | Escape |
| `.done` | Confirmation action | Title | Default action |
| `.save` | Cancellation action | Title on macOS; icon elsewhere | Default action |

`DismissButtonType.title` also exposes each button's localized title.

## Localization

The package includes English (the default), Dutch, French, and German labels.
It loads its `DismissToolbar` table from its own resource bundle using
`Bundle.module`.

Edit translations or add languages in
[DismissToolbar.xcstrings](Sources/SwiftUIComponents/Resources/Frontend/ToolbarContent/DismissToolbar.xcstrings).
In Xcode's string catalog editor, use the **+** button in the language sidebar
to add a language, then enter its translations.

## Project structure

Source code lives under `Sources/SwiftUIComponents/`, grouped into `Backend/`
and `Frontend/`. Localization catalogs under `Resources/` mirror the owning
component's folder path. For example:

```text
Frontend/ToolbarContent/DismissToolbar.swift
Resources/Frontend/ToolbarContent/DismissToolbar.xcstrings
```

Tests live under `Tests/SwiftUIComponentsTests/`, mirror the source folder
tree, and append `Tests` to the corresponding source filename.

## Testing

From the repository root on macOS with Xcode selected, run:

```sh
swift test
```

The Swift Testing suites cover button titles, bundled translations, toolbar
placements, custom action callbacks, and rendered label styles. Rendering
checks require macOS 13 or later. To test other supported platforms, open
`Package.swift` in Xcode and select an appropriate test destination.
