![Swift 5.9](https://img.shields.io/badge/Swift-5.9-F05138)
![iOS 15+](https://img.shields.io/badge/iOS-15%2B-blue)
![macOS 12+](https://img.shields.io/badge/macOS-12%2B-green)
![tvOS 15+](https://img.shields.io/badge/tvOS-15%2B-purple)
![watchOS 8+](https://img.shields.io/badge/watchOS-8%2B-yellow)

# SwiftUIHTMLText

A Swift package for rendering HTML strings in SwiftUI with tappable links. Supports two rendering backends — a lightweight SwiftUI renderer and a full-featured UIKit renderer — so you can choose the right trade-off for your use case.

## Requirements

- Swift 5.9+
- iOS 15+ / macOS 12+ / tvOS 15+ / watchOS 8+

## Installation

Add the package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/dnedrow/SwiftUIHTMLText.git", from: "1.0.0")
]
```

Or add it via Xcode: **File > Add Package Dependencies** and enter the repository URL.

## Overview

SwiftUIHTMLText provides three views and a pair of extensions depending on how much control you need:

| API | Renderer | Best For |
|-----|----------|----------|
| `HTMLText` | SwiftUI (`Text` + `AttributedString`) | Simple formatted text, links |
| `HTMLTextView` | UIKit (`UITextView`) | Lists, images, inline styles |
| `HTMLLabel` | Selectable | Switching renderers at runtime |
| `Text(html:)` | SwiftUI | Inline use inside existing `Text` |
| `AttributedString(html:)` | — | Custom rendering pipelines |

## Usage

### HTMLText

The simplest way to render HTML. Uses SwiftUI's `Text` under the hood.

```swift
import SwiftUIHTMLText

struct ContentView: View {
    var body: some View {
        HTMLText(html: "<p>Hello, <strong>world</strong>!</p>")
    }
}
```

**Custom link color:**

```swift
HTMLText(html: "Visit <a href=\"https://apple.com\">Apple</a>", linkColor: .purple)
```

**Handling link taps:**

```swift
HTMLText(html: "Read our <a href=\"https://example.com/terms\">Terms of Service</a>") { url in
    // Handle the tapped URL yourself
    print("Tapped: \(url)")
}
```

### HTMLTextView (UIKit)

Use when you need list rendering, image support, or finer typographic control. Requires UIKit (iOS, tvOS).

```swift
import SwiftUIHTMLText

struct ArticleView: View {
    let html = """
        <h2>Getting Started</h2>
        <p>Follow these steps:</p>
        <ul>
            <li>Install the package</li>
            <li>Import <code>SwiftUIHTMLText</code></li>
            <li>Drop in a view</li>
        </ul>
        """

    var body: some View {
        HTMLTextView(html: html)
    }
}
```

**Full configuration:**

```swift
HTMLTextView(
    html: articleHTML,
    font: .preferredFont(forTextStyle: .body),
    textColor: .label,
    linkColor: .systemBlue,
    lineBreakMode: .byWordWrapping,
    contentInsets: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
) { url in
    print("Link tapped: \(url)")
}
```

### HTMLLabel

A convenience view that lets you choose the renderer at runtime via the `HTMLRenderer` enum.

```swift
// SwiftUI renderer (default)
HTMLLabel(html: "<p>Hello <em>world</em></p>")

// UIKit renderer
HTMLLabel(html: "<p>Hello <em>world</em></p>", renderer: .uiKit)

// With link handling
HTMLLabel(html: "See <a href=\"https://example.com\">example.com</a>", renderer: .uiKit) { url in
    UIApplication.shared.open(url)
}
```

### Text extension

Render HTML inline inside an existing SwiftUI `Text` composition:

```swift
Text(html: "<strong>Bold</strong> and <em>italic</em> text")

// With custom defaults
Text(
    html: "<p>Styled content</p>",
    defaultFont: UIFont.systemFont(ofSize: 17),
    defaultColor: UIColor.secondaryLabel
)
```

### AttributedString extension

Convert HTML to an `AttributedString` for use in your own views or further manipulation:

```swift
if let attributed = AttributedString(html: "<b>Hello</b> world") {
    Text(attributed)
}
```

## Supported HTML

SwiftUIHTMLText uses Foundation's `NSAttributedString` HTML parser, so support varies by renderer:

| Element | SwiftUI renderer | UIKit renderer |
|---------|-----------------|----------------|
| `<b>`, `<strong>` | Yes | Yes |
| `<i>`, `<em>` | Yes | Yes |
| `<u>` | Yes | Yes |
| `<strike>` | Yes | Yes |
| `<a href>` | Yes | Yes |
| `<p>`, `<div>`, `<span>` | Yes | Yes |
| `<h1>`–`<h6>` | Yes | Yes |
| `<br>` | Yes | Yes |
| `<ul>`, `<ol>`, `<li>` | Limited | Yes |
| `<img>` | No | Yes |
| `<pre>`, `<code>` | Yes | Yes |
| Inline styles | Limited | Yes |

## License

SPDX-License-Identifier: MIT

See [LICENSE.md](LICENSE.md) for details.
