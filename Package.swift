// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ActionCableClient",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "ActionCableClient", targets: ["ActionCableClient"])
    ],
    dependencies: [
        .package(url: "https://github.com/daltoniam/Starscream.git", exact: "3.0.6")
    ],
    targets: [
        .target(
            name: "ActionCableClient",
            dependencies: ["Starscream"],
            path: "Source/Classes"
        )
    ],
    swiftLanguageVersions: [.v4]
)
