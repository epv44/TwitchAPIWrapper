//
//  Clip.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

class ClipWrapper: Codable {
    let clips: [Clip]
    
    private enum CodingKeys: String, CodingKey {
        case clips = "data"
    }
}

public class Clip: Codable {
    public let id: String
    public let url: URL
    public let embedURL: URL
    public let broadcasterId: String
    public let creatorId: String
    public let videoId: String
    public let gameId: String
    public let language: String
    public let title: String
    public let viewCount: Int
    public let createdAt: Date
    public let thumbnailURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case url
        case embedURL = "embed_url"
        case broadcasterId = "broadcaster_id"
        case creatorId = "creator_id"
        case videoId = "video_id"
        case gameId = "game_id"
        case language
        case title
        case viewCount = "view_count"
        case createdAt = "created_at"
        case thumbnailURL = "thumbnail_url"
    }
    
    init(id: String, url: URL, embedURL: URL, broadcasterId: String, creatorId: String, videoId: String, gameId: String, language: String, title: String, viewCount: Int, createdAt: Date, thumbnailURL: URL) {
        self.id = id
        self.url = url
        self.embedURL = embedURL
        self.broadcasterId = broadcasterId
        self.creatorId = creatorId
        self.videoId = videoId
        self.gameId = gameId
        self.language = language
        self.title = title
        self.viewCount = viewCount
        self.createdAt = createdAt
        self.thumbnailURL = thumbnailURL
    }
}
