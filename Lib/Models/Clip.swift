//
//  Clip.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

struct ClipWrapper: Codable {
    let clips: [Clip]

    private enum CodingKeys: String, CodingKey {
        case clips = "data"
    }
}

public struct Clip: Codable, Equatable {
    public let id: String
    public let url: URL
    public let embedUrl: URL
    public let broadcasterId: String
    public let creatorId: String
    public let videoId: String
    public let gameId: String
    public let language: String
    public let title: String
    public let viewCount: Int
    public let createdAt: Date
    public let thumbnailUrl: URL 
}
