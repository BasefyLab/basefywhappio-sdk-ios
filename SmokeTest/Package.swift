// swift-tools-version:5.9

import PackageDescription

// SDK'ya karşı duman testi. GitHub Actions'ta macOS üzerinde `swift run` ile çalışır.
//
// Not: `.package(path: "..")` bağımlılığının paket kimliği klasör adından gelir.
// GitHub Actions repoyu `basefywhappio-sdk-ios` adlı klasöre çeker, bu yüzden
// aşağıda `package: "basefywhappio-sdk-ios"` kullanılıyor. Yerelde farklı adlı bir
// klasörde (ör. `swift`) çalıştırırken bu değeri o klasörün adıyla değiştirin.
let package = Package(
    name: "SmokeTest",
    platforms: [
        .macOS(.v10_15),
    ],
    dependencies: [
        .package(path: ".."),
    ],
    targets: [
        .executableTarget(
            name: "SmokeTest",
            dependencies: [
                .product(name: "BasefyWhappioSDK", package: "basefywhappio-sdk-ios"),
            ],
            path: "Sources/SmokeTest"
        ),
    ]
)
