// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "MyPackage",
    platforms: [
        .macOS(.v10_14) // minimum macOS version driver supports
    ],
    dependencies: [
        .package(url: "https://github.com/mongodb/mongo-swift-driver", .upToNextMajor(from: "1.3.1"))
    ],
    targets: [
        // Async module
        .target(name: "MyAsyncTarget", dependencies: ["MongoSwift"]),
        // Sync module
        .target(name: "MySyncTarget", dependencies: ["MongoSwiftSync"])
    ]
)