//
//  StreamMetadata.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public class StreamMetadata: Codable {
    public let metadata: [TwitchMetadata]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case metadata = "data"
        case pagination
    }
}

public class Hero: Codable {
    public let type: String?
    public let `class`: String?
    public let name: String
    public let ability: String?
    public let role: String?
}

public class BroadcasterMetadata: Codable {
    public let broadcaster: Hero
    public let opponent: Hero
}

public class TwitchMetadata: Codable {
    public let userId: String
    public let gameId: String?
    public let overwatch: BroadcasterMetadata?
    public let hearthstone: BroadcasterMetadata?
    
    private enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case gameId = "game_id"
        case overwatch
        case hearthstone
    }
}
