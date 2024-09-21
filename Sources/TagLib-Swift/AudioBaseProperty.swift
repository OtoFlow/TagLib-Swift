//
//  AudioBaseProperty.swift
//  TagLib-Swift
//
//  Created by foyoodo on 21/9/2024.
//

public protocol AudioBaseProperty {

    var title: String? { get set }

    var artist: String? { get set }

    var album: String? { get set }

    var comment: String? { get set }

    var genre: String? { get set }

    var year: UInt? { get set }

    var track: UInt? { get set }
}
