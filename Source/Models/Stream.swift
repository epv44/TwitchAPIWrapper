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

public struct StreamWrapper: Codable, Equatable {
    public let streams: [Stream]
    public let pagination: Paginate
    
    private enum CodingKeys: String, CodingKey {
        case streams = "data"
        case pagination
    }
}

public struct Paginate: Codable, Equatable {
    public let cursor: String
}

public struct Stream: Codable, Equatable {
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
}
