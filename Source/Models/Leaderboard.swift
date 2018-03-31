//
//  Leaderboard.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public class Leaderboard: Codable {
    public let entries: [LeaderboardEntry]
    public let dateRange: DateRange
    public let total: Int
    
    private enum CodingKeys: String, CodingKey {
        case entries = "data"
        case dateRange = "date_range"
        case total
    }
    
    init(entries: [LeaderboardEntry], dateRange: DateRange, total: Int) {
        self.entries = entries
        self.dateRange = dateRange
        self.total = total
    }
}

public class DateRange: Codable {
    public let startedAt: Date
    public let endedAt: Date
    
    private enum CodingKeys: String, CodingKey {
        case startedAt = "started_at"
        case endedAt = "ended_at"
    }
    
    init(startedAt: Date, endedAt: Date) {
        self.startedAt = startedAt
        self.endedAt = endedAt
    }
}

public class LeaderboardEntry: Codable {
    public let userId: String
    public let rank: Int
    public let score: Int
    
    private enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case rank
        case score
    }
    
    init(userId: String, rank: Int, score: Int) {
        self.userId = userId
        self.rank = rank
        self.score = score
    }
}
