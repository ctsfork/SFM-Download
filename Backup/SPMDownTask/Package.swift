// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "vapor4",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        //
        // 版本规则说明：
        //           .exact("4.1.0") -> 指定版本  Ver == 4.1.0
        //           from: "4.1.0"   -> 版本满足  4.1.0 <= Ver < 5.0.0
        //           from: "4.0.0"   -> 版本满足  4.0.0 <= Ver < 5.0.0
        //
        //.package(url: "https://github.com/vapor/vapor.git", .exact("4.1.0")),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.1.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.2.6"),//2.0.0
        .package(url: "https://github.com/vapor/fluent-mysql-driver.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMajor(from: "1.6.0")),
        .package(url: "https://github.com/luoxiu/Schedule", .upToNextMajor(from: "2.0.0")), //Swift API Timer
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "Leaf", package: "leaf"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "FluentMySQLDriver", package: "fluent-mysql-driver"),
//                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "Schedule", package: "Schedule"),
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .target(name: "Run", dependencies: [.target(name: "App")]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
