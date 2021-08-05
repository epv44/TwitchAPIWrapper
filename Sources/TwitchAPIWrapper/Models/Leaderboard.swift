//
//  Leaderboard.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

/// Response object representing entries on the leaderboard see: https://dev.twitch.tv/docs/api/reference/#get-bits-leaderboard
public struct LeaderboardResponse: Codable, Equatable {
    public let entries: [LeaderboardEntry]
    public let dateRange: EVDateRange
    public let total: Int
    
    private enum CodingKeys: String, CodingKey {
        case entries = "data"
        case dateRange
        case total
    }
}

/// Helper object to model a date range server request
public struct EVDateRange: Codable, Equatable {
    public let startedAt: Date
    public let endedAt: Date
}

/// Object representing individual entries of the leadersboard see: https://dev.twitch.tv/docs/api/reference/#get-bits-leaderboard
public struct LeaderboardEntry: Codable, Equatable {
    public let userId: String
    public let userLogin: String
    public let userName: String
    public let rank: Int
    public let score: Int
}
