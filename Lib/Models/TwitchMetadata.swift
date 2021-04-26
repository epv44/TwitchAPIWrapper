//
//  StreamMetadata.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public struct StreamMetadata: Codable {
    public let metadata: [TwitchMetadata]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case metadata = "data"
        case pagination
    }
}

public struct Hero: Codable, Equatable {
    public let type: String?
    public let `class`: String?
    public let name: String
    public let ability: String?
    public let role: String?
}

public struct BroadcasterMetadata: Codable, Equatable {
    public let broadcaster: Hero
    public let opponent: Hero
}

public struct TwitchMetadata: Codable, Equatable {
    public let userId: String
    public let gameId: String?
    public let overwatch: BroadcasterMetadata?
    public let hearthstone: BroadcasterMetadata?
}
