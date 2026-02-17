
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftUIHTMLText",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(name: "SwiftUIHTMLText", targets: ["SwiftUIHTMLText"])
    ],
    targets: [
        .target(
            name: "SwiftUIHTMLText",
            path: "Sources/SwiftUIHTMLText",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "SwiftUIHTMLTextTests",
            dependencies: ["SwiftUIHTMLText"],
            path: "Tests/SwiftUIHTMLTextTests"
        )
    ]
)
