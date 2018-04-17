//
//  GameAnalytics.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

struct GameAnalyticsWrapper: Codable {
    let gameAnalytics: [GameAnalytic]
    
    private enum CodingKeys: String, CodingKey {
        case gameAnalytics = "data"
    }
}

public struct GameAnalytic: Codable, Equatable {
    public let gameId: String
    public let url: URL
}
