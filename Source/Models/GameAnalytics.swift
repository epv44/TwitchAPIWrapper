//
//  GameAnalytics.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

class GameAnalyticsWrapper: Codable {
    let gameAnalytics: [GameAnalytic]
    
    private enum CodingKeys: String, CodingKey {
        case gameAnalytics = "data"
    }
}

public class GameAnalytic: Codable {
    public let gameId: String
    public let url: URL
    
    private enum CodingKeys: String, CodingKey {
        case gameId = "game_id"
        case url = "URL"
    }
    
    init(gameId: String, url: URL) {
        self.gameId = gameId
        self.url = url
    }
}
