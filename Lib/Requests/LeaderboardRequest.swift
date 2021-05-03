//
//  LeaderboardRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/2/18.
//

import Foundation

public struct LeaderboardRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        count: String? = nil,
        period: String? = nil,
        startedAt: String? = nil,
        userID: String? = nil
    ) {
        let queryItems = [
            "count": count,
            "period": period,
            "started_at": startedAt,
            "user_id": userID].buildQueryItems()
        self.url = TwitchEndpoints.leaderboard.construct()?.appending(queryItems: queryItems)
    }
}
