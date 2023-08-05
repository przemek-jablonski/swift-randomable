// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-randomable",
  products: [
    .library(
      name: "swift-randomable",
      targets: ["swift-randomable"]
    ),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "swift-randomable",
      dependencies: []
    ),
    .testTarget(
      name: "swift-randomable-tests",
      dependencies: ["swift-randomable"]
    ),
  ]
)
