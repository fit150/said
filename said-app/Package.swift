// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "said-app",
    platforms: [
        .iOS(.v26),
        .macOS(.v26)
    ],
    products: [
        .library(
            name: "SaidApp",
            targets: ["SaidApp"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/ml-explore/mlx-swift-lm.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "SaidApp",
            dependencies: [
                .product(name: "MLXLLM", package: "mlx-swift-lm")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)