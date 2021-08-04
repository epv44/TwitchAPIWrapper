//
//  Clip.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public struct ClipResponse: Codable {
    public let clips: [Clip]
    public let pagination: Paginate?

    private enum CodingKeys: String, CodingKey {
        case clips = "data"
        case pagination
    }
}

public struct Clip: Codable, Equatable {
    public let id: String
    public let url: URL
    public let embedUrl: URL
    public let broadcasterId: String
    public let broadcasterName: String
    public let creatorId: String
    public let creatorName: String
    public let videoId: String
    public let gameId: String
    public let language: String
    public let title: String
    public let viewCount: Int
    public let createdAt: Date
    public let thumbnailUrl: URL
    public let duration: Double
}
