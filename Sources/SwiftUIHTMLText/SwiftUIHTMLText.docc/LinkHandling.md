
# LinkHandling

Control how links are opened for both renderers.

## SwiftUI Renderer

Use the `openURL` environment to intercept taps from the SwiftUI renderer:

```swift
HTMLText(html: html) { url in
    // Decide what to do with the URL
    // e.g., custom router, analytics, or open in-app
}
```

## UIKit Renderer

Use the `Coordinator`'s delegate hook to intercept before the system opens the link:

```swift
HTMLTextView(html: html) { url in
    // Handle the tap yourself, return false to stop default behavior
    // UIApplication.shared.open(url) if you want to forward to Safari
}
```

## Theming Links

- **SwiftUI**: Use `.tint(_:)` to set the link color (iOS 16+). On iOS 15, provide a default color during HTML → `AttributedString` conversion.
- **UIKit**: Customize `linkTextAttributes` or pass the `linkColor:` initializer parameter.
