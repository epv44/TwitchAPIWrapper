//
//  GameAnalyticsResource.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

///Get game analytics request see https://dev.twitch.tv/docs/api/reference/#get-game-analytics for details
public struct GameAnalyticsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        gameID: String? = nil,
        after: String? = nil,
        endedAt: String? = nil,
        first: String? = nil,
        startedAt: String? = nil,
        type: String? = nil
    ) {
        self.url = TwitchEndpoints.gameAnalytics.construct()?.appending(
            queryItems: [
                "game_id": gameID,
                "after": after,
                "endedAt": endedAt,
                "first": first,
                "startedAt": startedAt,
                "type": type,
            ].buildQueryItems())
    }
}


