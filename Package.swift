// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SFM-Download",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),

        // 直接导入本地仓库
        //.package(path: "Local/wcdb")

        // 使用exact直接限定到指定版本
        //.package(url: "https://github.com/Tencent/wcdb.git" , exact: "2.1.15"),

        // 使用revision固定到某个 Git commit（不推荐长期使用）
        //.package(url: "https://github.com/Tencent/wcdb.git" , revision: "abcdef1234567890"),

        // 使用from允许解析更高版本，但不会夸主版本
        .package(url: "https://github.com/Tencent/wcdb.git" , from: "2.1.15"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "SFM-Download",
            dependencies: []),
        .testTarget(
            name: "SFM-DownloadTests",
            dependencies: ["SFM-Download"]),
    ]
)
