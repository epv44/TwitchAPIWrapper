//
//  LeaderboardResource.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/2/18.
//

import Foundation

public struct LeaderboardResource: JSONConstructableRequest {
    let url: URL?
    let headers: [String : String]
    
    init(count: Int? = nil, period: String? = nil, startedAt: String? = nil) throws {
        var queryItems = [URLQueryItem]()
        if let count = count {
            queryItems.append(URLQueryItem(name: "count", value: String(describing: count)))
        }
        if let period = period {
            queryItems.append(URLQueryItem(name: "period", value: period))
        }
        if let startedAt = startedAt {
            queryItems.append(URLQueryItem(name: "started_at", value: startedAt))
        }
        self.url = TwitchEndpoints.leaderboard.construct()?.appending(queryItems: queryItems)

        guard let clientId = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            throw NSError()
        }
        self.headers = ["Authorization": clientId]
    }
}
