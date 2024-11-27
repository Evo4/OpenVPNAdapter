// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenVPNAdapter",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_13)
    ],
    products: [
        .library(name: "OpenVPNAdapter", targets: ["OpenVPNAdapter"]),
    ],
    targets: [
        .target(
            name: "OpenVPNAdapter",
            dependencies: [
                .target(name: "mbedTLS"),
                .target(name: "OpenVPNClient")
            ],
            sources: ["library"],
            cxxSettings: [
                .headerSearchPath("../ASIO/asio/include"),
                .headerSearchPath("../OpenVPN3"),
                .define("USE_ASIO")
            ]
        ),
        .target(
            name: "LZ4",
            sources: ["lib"],
            cSettings: [
                .define("XXH_NAMESPACE", to: "LZ4_")
            ]
        ),
        .target(
            name: "mbedTLS",
            sources: ["library"],
            cSettings: [
                .define("MBEDTLS_MD4_C"),
                .define("MBEDTLS_RELAXED_X509_DATE"),
                .define("_FILE_OFFSET_BITS", to: "64"),
            ]
        ),
        .target(
            name: "OpenVPNClient",
            dependencies: [
                .target(name: "LZ4"),
                .target(name: "mbedTLS")
            ],
            sources: ["library"],
            cxxSettings: [
                .headerSearchPath("../ASIO/asio/include"),
                .headerSearchPath("../OpenVPN3"),
                .define("USE_ASIO"),
                .define("USE_ASIO_THREADLOCAL"),
                .define("ASIO_STANDALONE"),
                .define("ASIO_NO_DEPRECATED"),
                .define("ASIO_HAS_STD_STRING_VIEW"),
                .define("USE_MBEDTLS"),
                .define("HAVE_LZ4"),
                .define("OPENVPN_FORCE_TUN_NULL"),
                .define("USE_TUN_BUILDER")
            ]
        )
    ],
    swiftLanguageModes: [.v5],
    cxxLanguageStandard: .gnucxx14
)
