// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let packageName = "Firebase"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(name: packageName, targets: [ packageName ]),
    ],
    targets: [
        .target(
            name: packageName,
            dependencies: [
                .target(name: "Binaries")
            ]
        ),
        
        .target(
            name: "Binaries",
            dependencies: [
                .target(name: "FirebaseCore"),
            ]
        ),
        
        .binaryTarget(name: "FirebaseCore",
                      path: "FirebaseCore/FirebaseCore.xcframework"),
    ]
)

