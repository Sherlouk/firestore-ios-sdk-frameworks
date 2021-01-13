// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let packageName = "Firebase"

// Create a file URL pointing to the Exports swift file stored in Sources
let exportsURL = URL(fileURLWithPath: #filePath)
    .deletingLastPathComponent() // Package.swift -> Parent Directory
    .appendingPathComponent("Sources/Exports.swift")

// Extract each of the individual exported imports.
let imports = ((try? String(contentsOf: exportsURL)) ?? "")
    .components(separatedBy: .newlines) // Convert file into lines
    .filter { $0.starts(with: "@_exported import") } // Remove comments and empty lines
    .compactMap { $0.components(separatedBy: "import ").last?.trimmingCharacters(in: .whitespaces) }

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v10), 
        .macOS(.v10_12), 
        .tvOS(.v10), 
        .watchOS(.v6)
    ],
    products: [
        .library(name: packageName, targets: [ packageName ]),
    ],
    targets: [
        .target(
            name: packageName,
            dependencies: imports.map { .target(name: $0) },
            path: "Sources",
            sources: ["Exports.swift"]
        )
    ] + imports.map { .binaryTarget(name: $0, path: "FirebaseFirestore/\($0).xcframework") }
)
