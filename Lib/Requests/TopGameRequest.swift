//
//  TopGameRequest.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import Foundation

///Get top games request https://dev.twitch.tv/docs/api/reference/#get-top-games for details
public struct TopGameRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(after: String? = nil, before: String? = nil, first: String? = nil) {
        self.url = TwitchEndpoints.topGames.construct()?.appending(
            queryItems: [
                "after": after,
                "before": before,
                "first": first].buildQueryItems())
    }
}

