//
//  CrossPlatform.swift
//  TagLib-Swift
//
//  Created by Xianhe Meng on 2024/11/29.
//

#if compiler(>=6)
extension TLCrossPlatformImage: @retroactive @unchecked Sendable { }
#else
extension TLCrossPlatformImage: @unchecked Sendable { }
#endif // compiler(>=6)

#if os(macOS)
import AppKit
public typealias TLCrossPlatformImage = NSImage

extension TLCrossPlatformImage {
    package func pngData() -> Data? {
        guard let tiffData = tiffRepresentation,
              let bitmapImageRep = NSBitmapImageRep(data: tiffData)
        else { return nil }

        let pngData = bitmapImageRep.representation(using: .png, properties: [:])

        return pngData
    }
}
#else // os(macOS)
import UIKit
public typealias TLCrossPlatformImage = UIImage
#endif
