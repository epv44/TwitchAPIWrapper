//
//  GameRequest.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import Foundation

public struct GameRequest: JSONConstructableRequest {
    var url: URL?
    let headers: [String : String]
    
    public init(id: [String], name: [String]) {
        self.url = TwitchEndpoints.games.construct()?.appending(queryItems: ["id": id, "name": name].buildQueryItems())
        guard let clientID = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Client-ID": clientID]
    }
}

