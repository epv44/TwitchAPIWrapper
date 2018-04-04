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
    
    init(broadcasterId: String) {
        self.url = TwitchEndpoints.topGames.construct()?.appending(queryItems: [URLQueryItem(name: "broadcaster_id", value: broadcasterId)])
        guard let clientId = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Authorization": clientId]
    }
}
