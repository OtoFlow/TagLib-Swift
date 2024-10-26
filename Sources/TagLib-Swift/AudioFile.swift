//
//  AudioFile.swift
//  TagLib-Swift
//
//  Created by foyoodo on 21/9/2024.
//

import Foundation
@_implementationOnly import TagLibImp

#if os(macOS)
import AppKit
public typealias TLCrossPlatformImage = NSImage
#else // os(macOS)
import UIKit
public typealias TLCrossPlatformImage = UIImage
#endif


public final class AudioFile {

    public let url: URL

    private let file: TagLib.File

    private var isApplied = true

    deinit {
        apply()
    }

    public init(url: URL) {
        self.url = url

        if url.pathExtension == "flac" {
            self.file = TagLib.FLACFile(url: url)
        } else {
            self.file = TagLib.File(url: url)
        }
    }

    public func apply() {
        if isApplied { return }
        file.save()
        isApplied = true
    }
}

// MARK: - AudioBaseProperty
extension AudioFile: AudioBaseProperty {

    public var title: String? {
        get { file.title }
        set { file.title = newValue; isApplied = false }
    }

    public var artist: String? {
        get { file.artist }
        set { file.artist = newValue; isApplied = false }
    }

    public var album: String? {
        get { file.album }
        set { file.album = newValue; isApplied = false }
    }

    public var comment: String? {
        get { file.comment }
        set { file.comment = newValue; isApplied = false }
    }

    public var genre: String? {
        get { file.genre }
        set { file.genre = newValue; isApplied = false }
    }

    public var year: UInt? {
        get { file.year?.uintValue }
        set { file.year = newValue.map { .init(value: $0) }; isApplied = false }
    }

    public var track: UInt? {
        get { file.track?.uintValue }
        set { file.track = newValue.map { .init(value: $0) }; isApplied = false }
    }

    public var pictures: [TLCrossPlatformImage]? {
        get { file.pictures?.compactMap { .init(data: $0.data) } }
        set {
            file.pictures = newValue?.compactMap { image in
                #if os(macOS)
                guard let data = image.tiffRepresentation else { return nil }
                #else
                guard let data = image.pngData() else { return nil }
                #endif
                return .init(data: data, size: image.size)
            }
            isApplied = false
            apply()
        }
    }
}
