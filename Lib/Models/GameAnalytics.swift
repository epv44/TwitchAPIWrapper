//
//  GameAnalytics.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

public struct GameAnalyticsResponse: Codable {
    public let gameAnalytics: [GameAnalytic]
    
    private enum CodingKeys: String, CodingKey {
        case gameAnalytics = "data"
    }
}

public struct GameAnalytic: Codable, Equatable {
    public let gameId: String
    public let url: URL
}
