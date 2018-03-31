//
//  Stream.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public class StreamWrapper: Codable {
    let streams: [Stream]
    let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case streams = "data"
        case pagination
    }
}

public class Paginate: Codable {
    let cursor: String
}

public class Stream: Codable {
    let id: String
    let userId: String
    let gameId: String
    let communityIds: [String]
    let type: String
    let title: String
    let viewCount: Int
    let startedAt: Date
    let language: String
    let thumbnailURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case gameId = "game_id"
        case communityIds = "community_ids"
        case type
        case title
        case viewCount = "view_count"
        case startedAt = "started_at"
        case language
        case thumbnailURL = "thumbnail_url"
    }
}
