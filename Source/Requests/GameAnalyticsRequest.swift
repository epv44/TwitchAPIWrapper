//
//  GameAnalyticsResource.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

public struct GameAnalyticsRequest: JSONConstructableRequest {
    var url: URL?
    let headers: [String : String]
    
    public init(gameId: String? = nil) {
        self.url = TwitchEndpoints.gameAnalytics.construct()?.appending(queryItems: ["game_id": gameId].buildQueryItems())
        guard let authToken = TwitchAuthorizationManager.sharedInstance.authToken else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Authorization": authToken]
    }
}
