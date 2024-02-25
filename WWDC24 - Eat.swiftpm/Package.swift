// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "WWDC24 - Eat",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "WWDC24 - Eat",
            targets: ["AppModule"],
            bundleIdentifier: "andryanajonathan.WWDC24---Eat",
            teamIdentifier: "3RXGWUTBRR",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .openBook),
            accentColor: .presetColor(.brown),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            capabilities: [
                .camera(purposeString: "Unknown Usage Description")
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)