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

public struct StreamResponse: Codable, Equatable {
    public let streams: [Stream]
    public let pagination: Paginate?
    
    private enum CodingKeys: String, CodingKey {
        case streams = "data"
        case pagination
    }
}

public struct Paginate: Codable, Equatable {
    public let cursor: String?
}

public struct Stream: Codable, Equatable {
    public let id: String
    public let userId: String
    public let userLogin: String
    public let userName: String
    public let gameId: String
    public let gameName: String
    public let type: StreamType
    public let title: String
    public let viewerCount: Int
    public let startedAt: Date
    public let language: String
    // Optional string due to url encoding issue from the twitch api
    public let thumbnailUrl: String?
    public let tagIds: [String]
    public let isMature: Bool?
}
