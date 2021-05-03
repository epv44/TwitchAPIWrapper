//
//  Leaderboard.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public struct Leaderboard: Codable, Equatable {
    public let entries: [LeaderboardEntry]
    public let dateRange: DateRange
    public let total: Int
}

public struct DateRange: Codable, Equatable {
    public let startedAt: Date
    public let endedAt: Date
}

public struct LeaderboardEntry: Codable, Equatable {
    public let userId: String
    public let userLogin: String
    public let userName: String
    public let rank: Int
    public let score: Int
}
