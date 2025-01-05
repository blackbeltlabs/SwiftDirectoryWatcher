// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "SwiftDirectoryWatcher",
    platforms: [.macOS("10.13")],
    products: [
        .library(
            name: "SwiftDirectoryWatcher",
            type: .dynamic,
            targets: ["SwiftDirectoryWatcher"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftDirectoryWatcher",
            dependencies: [])
    ]
)
