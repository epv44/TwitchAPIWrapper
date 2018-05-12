//
//  TopGameRequest.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import Foundation

public struct TopGameRequest: JSONConstructableRequest {
    let url: URL?
    let headers: [String : String]
    
    public init(after: String? = nil, before: String? = nil, first: String? = nil) {
        self.url = TwitchEndpoints.topGames.construct()?.appending(queryItems: ["after":after, "before":before, "first":first].buildQueryItems())
        guard let clientID = TwitchAuthorizationManager.sharedInstance.clientID else {
            EVLog(text: "Must specify client_id to make rest request", line: #line, fileName: #file)
            headers = [:]
            return
        }
        self.headers = ["Client-ID": clientID]
    }
}

