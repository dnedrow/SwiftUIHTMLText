
# ``SwiftUIHTMLText``

Render HTML strings in SwiftUI with tappable links. Choose a pure SwiftUI renderer or a UIKit-backed renderer for richer HTML.

@Metadata {
  @TechnologyRoot
  @PageKind(article)
}

## Overview

`SwiftUIHTMLText` provides:

- ``Text(html:defaultFont:defaultColor:)`` — A `Text` initializer that converts small HTML fragments into an `AttributedString`, preserving links.
- ``HTMLText`` — A SwiftUI view that renders HTML and integrates with the SwiftUI `openURL` environment.
- ``HTMLTextView`` — A `UIViewRepresentable` that wraps `UITextView` for broader HTML support and native link interactions.
- ``HTMLLabel`` — A convenience view that switches between the SwiftUI and UIKit renderers.

> Important: Images inside HTML (e.g., `<img>`) are not rendered by `Text`. Use ``HTMLTextView`` for image support, lists, and complex inline styles.

### Minimum Requirements
- iOS 15, macOS 12, tvOS 15, watchOS 8
- Swift 5.9 toolchain

## Quick Start

```swift
import SwiftUI
import SwiftUIHTMLText

struct ContentView: View {
    let html = "<p>This is <strong>HTML</strong> with an <a href=\"https://www.apple.com\">Apple</a> link.</p>"

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Pure SwiftUI renderer (links handled with openURL)
            HTMLText(html: html) { url in
                print("Tapped:", url)
            }

            // UIKit-backed renderer for richer HTML
            #if canImport(UIKit)
            HTMLTextView(html: html)
            #endif
        }
        .tint(.blue) // Link color for SwiftUI renderer (iOS 16+)
        .padding()
    }
}
```

## Topics

### Essentials
- <doc:RenderingHTML>
- <doc:LinkHandling>
