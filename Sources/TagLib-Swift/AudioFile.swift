//
//  AudioFile.swift
//  TagLib-Swift
//
//  Created by foyoodo on 21/9/2024.
//

import Foundation
@_implementationOnly import TagLibImp

public final class AudioFile {

    public let url: URL

    private let file: TagLib.File

    private var isApplied = true

    deinit {
        apply()
    }

    public init(url: URL) {
        self.url = url
        self.file = TagLib.File(url: url)
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
        set { file.year = newValue.map(NSNumber.init(value:)); isApplied = false }
    }

    public var track: UInt? {
        get { file.track?.uintValue }
        set { file.track = newValue.map(NSNumber.init(value:)); isApplied = false }
    }
}
