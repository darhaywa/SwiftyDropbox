// swift-tools-version:5.1
///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///

import PackageDescription

let package = Package(
    name: "SwiftyDropbox",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10)
    ],
    products: [
        .library(
            name:"SwiftyDropbox",
            targets: [ "SwitfyDropbox" ]
        ),
        .library(
            name: "ObjClyDropbox",
            targets: [ "ObjClyDropbox" ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git",
                 .upToNextMinor(from: "4.8.2")),
    ],
    targets: [
        .target(
            name: "ObjClyDropbox",
            path: "Source",
            sources: [
                "SwiftyDropbox/Shared/Handwritten/DBChunkInputStream.m",
            ]
        ),
        .target(
            name: "SwitfyDropbox",
            dependencies: ["ObjClyDropbox", "Alamofire"],
            path: "Source",
            exclude: [
                "SwiftyDropbox/Shared/Handwritten/DBChunkInputStream.m",
            ]
        )
    ]
)
