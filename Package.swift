// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ToolKit",
  platforms: [
    .iOS(.v14), .macOS(.v10_15)
  ],
  products: [
    .library(
      name: "ToolKit",
      targets: ["ToolKit"]
    ),
  ],
  targets: [
    .target(
      name: "ToolKit",
      dependencies: [],
      swiftSettings: [
        .define("APPLICATION_EXTENSION_API_ONLY=YES"),
      ]
    )
  ]
)
