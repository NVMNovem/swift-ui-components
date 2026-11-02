import SwiftUI
import Testing
@testable import SwiftUIComponents

@MainActor
struct LabelStyleModifierTests {
    private var label: some View {
        Label("Dismiss", systemImage: "xmark")
            .font(.system(size: 20))
    }

    @Test func desktopInterfaceShowsTitle() throws {
        guard #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) else { return }

        let actual = try pixels(label.labelStyle(isDesktopInterface: true))
        let expected = try pixels(label.labelStyle(.titleOnly))
        let iconOnly = try pixels(label.labelStyle(.iconOnly))

        #expect(actual == expected)
        #expect(actual != iconOnly)
    }

    @Test func otherInterfacesShowIcon() throws {
        guard #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) else { return }

        let actual = try pixels(label.labelStyle(isDesktopInterface: false))
        let expected = try pixels(label.labelStyle(.iconOnly))
        let titleOnly = try pixels(label.labelStyle(.titleOnly))

        #expect(actual == expected)
        #expect(actual != titleOnly)
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    private func pixels(_ view: some View) throws -> [UInt8] {
        let renderer = ImageRenderer(content: view
            .frame(width: 160, height: 60)
            .environment(\.colorScheme, .light))
        renderer.scale = 1
        let image = try #require(renderer.cgImage)
        let data = try #require(image.dataProvider?.data)
        let bytes = try #require(CFDataGetBytePtr(data))
        return Array(UnsafeBufferPointer(start: bytes, count: CFDataGetLength(data)))
    }
}
