// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TagLib-Swift",
    platforms: [.iOS(.v12), .macOS(.v10_13), .tvOS(.v12)],
    products: [
        .library(name: "TagLib-Swift", targets: ["TagLib-Swift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sbooth/CXXTagLib.git", from: "2.0.2"),
    ],
    targets: [
        .target(
            name: "TagLib-Swift",
            dependencies: [
                "TagLibImp",
            ]
        ),
        .target(
            name: "TagLibImp",
            dependencies: [
                .product(name: "taglib", package: "CXXTagLib"),
            ],
            cSettings: [
                .headerSearchPath("include"),
            ]
        )
    ],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx17
)
