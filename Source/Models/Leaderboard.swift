//
//  Leaderboard.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public class Leaderboard: Codable {
    let entries: [LeaderboardEntry]
    let dateRange: DateRange
    let total: Int
    
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
    let startedAt: Date
    let endedAt: Date
    
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
    let userId: String
    let rank: Int
    let score: Int
    
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

extension JSONDecoder {
    class func twitchAPIStandard() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Date.twitchStandardDateFormatter)
        
        return decoder
    }
}

extension JSONEncoder {
    class func twitchAPIStandard() -> JSONEncoder {
        let decoder = JSONEncoder()
        decoder.dateEncodingStrategy = .formatted(Date.twitchStandardDateFormatter)
        
        return decoder
    }
}

extension Date {
    static var twitchStandardDateFormatter: DateFormatter {
        struct Static {
            static let instance: DateFormatter = {
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                return df
            }()
        }
        return Static.instance
    }
}
