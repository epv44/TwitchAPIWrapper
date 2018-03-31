//
//  StreamMetadata.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public class StreamMetadataWrapper: Codable {
    let streamsMetadata: [StreamMetadata]
    let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case streamsMetadata = "data"
        case pagination
    }
}

public class Hero: Codable {
    let type: String?
    let `class`: String?
    let name: String
    let ability: String?
    let role: String?
}

public class BroadcasterMetadata: Codable {
    let broadcaster: Hero
    let opponent: Hero
}

public class StreamMetadata: Codable {
    let userId: String
    let gameId: String?
    let overwatch: BroadcasterMetadata?
    let hearthstone: BroadcasterMetadata?
    
    private enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case gameId = "game_id"
        case overwatch
        case hearthstone
    }
}
