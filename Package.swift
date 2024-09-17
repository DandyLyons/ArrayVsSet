// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ArrayVsSet",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ArrayVsSet",
            targets: ["ArrayVsSet"]),
        .executable(name: "ArrayVsSetBenchmark", targets: ["ArrayVsSetBenchmark"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections-benchmark", from: "0.0.3"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ArrayVsSet"),
        .executableTarget(
            name: "ArrayVsSetBenchmark",
            dependencies: [
                "ArrayVsSet",
                .product(name: "CollectionsBenchmark", package: "swift-collections-benchmark"),
            ]
        ),

    ]
)
