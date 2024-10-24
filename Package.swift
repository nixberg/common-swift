// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "common-swift",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "Common",
            targets: ["Common"]),
        .library(
            name: "CommonFoundation",
            targets: ["CommonFoundation"]),
    ],
    targets: [
        .target(
            name: "Common"),
        .target(
            name: "CommonFoundation"),
        .testTarget(
            name: "CommonTests",
            dependencies: ["Common"]
        ),
    ]
)
