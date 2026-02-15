// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "said-app",
    platforms: [
        .iOS(.v26)
    ],
    products: [
        .library(
            name: "SaidUI",
            targets: ["SaidUI"]
        )
    ],
    targets: [
        .target(
            name: "SaidUI"
        )
    ]
)