//
//  GameAnalytics.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

/// GameAnalyticsResponse models the response from https://dev.twitch.tv/docs/api/reference/#get-game-analytics
public struct GameAnalyticsResponse: Codable {
    public let gameAnalytics: [GameAnalytic]
    
    private enum CodingKeys: String, CodingKey {
        case gameAnalytics = "data"
    }
}

// Inner object modeling
public struct GameAnalytic: Codable, Equatable {
    public let gameId: String
    public let url: URL
    public let type: String
    public let dateRange: EVDateRange
    
    private enum CodingKeys: String, CodingKey {
        case gameId
        case url = "URL"
        case type
        case dateRange
    }
}
