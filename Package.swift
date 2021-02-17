// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-toolkit",
  platforms: [
    .macOS(.v10_13), .iOS(.v12), .tvOS(.v12), .watchOS(.v5)
  ],
  products: [
    .library(
      name: "ToolKit",
      targets: ["ToolKit"]),
  ],
  targets: [
    .target(
      name: "ToolKit",
      dependencies: [])
  ]
)
