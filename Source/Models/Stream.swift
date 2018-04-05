//
//  Stream.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public enum StreamType: String, Codable {
    case live
    case vodcast
    case none = ""
    case all
}

public class StreamWrapper: Codable {
    public let streams: [Stream]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case streams = "data"
        case pagination
    }
}

public class Paginate: Codable {
    public let cursor: String
}

public class Stream: Codable {
    public let id: String
    public let userId: String
    public let gameId: String
    public let communityIds: [String]
    public let type: StreamType
    public let title: String
    public let viewCount: Int
    public let startedAt: Date
    public let language: String
    public let thumbnailURL: URL
    
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
