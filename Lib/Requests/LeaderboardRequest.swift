//
//  LeaderboardRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/2/18.
//

import Foundation

public struct LeaderboardRequest: JSONConstructableRequest {
    public let url: URL?
    public let headers: [String : String]
    
    public init(count: String? = nil, period: String? = nil, startedAt: String? = nil) {
        let queryItems = ["count": count as Any, "period": period as Any, "started_at": startedAt as Any].buildQueryItems()
        self.url = TwitchEndpoints.leaderboard.construct()?.appending(queryItems: queryItems)

        guard let clientID = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Client-ID": clientID]
    }
}
