//
//  Stream.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

/// Type specific to `StreamResponse`  see https://dev.twitch.tv/docs/api/reference/#get-followed-streams
public enum StreamType: String, Codable {
    case live
    case vodcast
    case none = ""
    case all
}
/// Response object for stream request: https://dev.twitch.tv/docs/api/reference/#get-followed-streams
public struct StreamResponse: Codable, Equatable {
    public let streams: [Stream]
    public let pagination: Paginate?
    
    private enum CodingKeys: String, CodingKey {
        case streams = "data"
        case pagination
    }
}

/// Pagination object used for certain API responses
public struct Paginate: Codable, Equatable {
    /// `string` representing your pagination cursor
    public let cursor: String?
}

/// underlying stream object see `StreamResponse`  and https://dev.twitch.tv/docs/api/reference/#get-followed-streams
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
