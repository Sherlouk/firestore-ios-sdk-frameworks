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
                .target(name: "abseil"),
                .target(name: "BoringSSL-GRPC"),
                .target(name: "FirebaseFirestore"),
                .target(name: "gRPC-C++"),
                .target(name: "gRPC-Core"),
                .target(name: "leveldb-library"),
                
                .target(name: "FirebaseCore"),
                .target(name: "FirebaseCoreDiagnostics"),
                .target(name: "FirebaseInstallations"),
                .target(name: "GoogleAppMeasurement"),
                .target(name: "GoogleDataTransport"),
                .target(name: "GoogleUtilities"),
                .target(name: "nanopb"),
                .target(name: "PromisesObjC"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        
        .binaryTarget(name: "abseil",
                      path: "FirebaseFirestore/abseil.xcframework"),
        .binaryTarget(name: "BoringSSL-GRPC",
                      path: "FirebaseFirestore/BoringSSL-GRPC.xcframework"),
        .binaryTarget(name: "FirebaseFirestore",
                      path: "FirebaseFirestore/FirebaseFirestore.xcframework"),
        .binaryTarget(name: "gRPC-C++",
                      path: "FirebaseFirestore/gRPC-C++.xcframework"),
        .binaryTarget(name: "gRPC-Core",
                      path: "FirebaseFirestore/gRPC-Core.xcframework"),
        .binaryTarget(name: "leveldb-library",
                      path: "FirebaseFirestore/leveldb-library.xcframework"),
        
        .binaryTarget(name: "FirebaseCore",
                      path: "FirebaseCore/FirebaseCore.xcframework"),
        .binaryTarget(name: "FirebaseCoreDiagnostics",
                      path: "FirebaseCore/FirebaseCoreDiagnostics.xcframework"),
        .binaryTarget(name: "FirebaseInstallations",
                      path: "FirebaseCore/FirebaseInstallations.xcframework"),
        .binaryTarget(name: "GoogleAppMeasurement",
                      path: "FirebaseCore/GoogleAppMeasurement.xcframework"),
        .binaryTarget(name: "GoogleDataTransport",
                      path: "FirebaseCore/GoogleDataTransport.xcframework"),
        .binaryTarget(name: "GoogleUtilities",
                      path: "FirebaseCore/GoogleUtilities.xcframework"),
        .binaryTarget(name: "nanopb",
                      path: "FirebaseCore/nanopb.xcframework"),
        .binaryTarget(name: "PromisesObjC",
                      path: "FirebaseCore/PromisesObjC.xcframework"),
    ]
)

