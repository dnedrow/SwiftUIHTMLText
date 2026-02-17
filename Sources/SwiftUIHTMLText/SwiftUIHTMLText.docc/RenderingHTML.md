
# RenderingHTML

Learn how to render HTML with either SwiftUI's `Text` + `AttributedString` or a UIKit-backed `UITextView`.

## SwiftUI (AttributedString) Path

The SwiftUI path converts a subset of HTML into an `AttributedString` and renders it using `Text`. Links remain tappable via the SwiftUI environment's `openURL`.

```swift
import SwiftUI
import SwiftUIHTMLText

let html = "<p>Visit <a href=\"https://developer.apple.com\">Apple Developer</a>.</p>"

var body: some View {
    HTMLText(html: html) { url in
        // Optionally intercept link taps
        // perform analytics, in-app routing, etc.
    }
    .tint(.accentColor)
}
```

## UIKit (UITextView) Path

Prefer this when you need lists, inline styles, images, or other advanced HTML. Links are tappable by default.

```swift
#if canImport(UIKit)
import SwiftUI
import SwiftUIHTMLText

let html = "<h4>Welcome</h4>\n<p>Rich HTML with a list:</p>\n<ul><li>First</li><li>Second</li><li>Third</li></ul>"

var body: some View {
    HTMLTextView(html: html)
}
#endif
```
