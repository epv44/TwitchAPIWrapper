//
//  TeamRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/20/21.
//

import Foundation

///Get team request https://dev.twitch.tv/docs/api/reference/#get-teams
public struct TeamRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(name: String? = nil, id: String? = nil) {
        self.url = TwitchEndpoints.teams.construct()?.appending(queryItems: ["name": name, "id": id].buildQueryItems())
    }
}
