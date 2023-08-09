// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

internal let package = Package(
  name: "swift-randomable",
  platforms: [
    .iOS(.v13),
    .watchOS(.v6),
    .tvOS(.v13),
    .macOS(.v11)
  ],
  products: [
    .library(
      name: "Randomable",
      targets: ["Randomable"]
    )
  ],
  targets: [
    .target(
      name: "Randomable",
      dependencies: []
    ),
    .testTarget(
      name: "Randomable-Tests",
      dependencies: ["Randomable"]
    )
  ]
)
