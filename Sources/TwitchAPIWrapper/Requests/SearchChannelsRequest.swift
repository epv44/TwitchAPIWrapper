//
//  SearchChannelsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

// GET Search Channels see: https://dev.twitch.tv/docs/api/reference/#search-channels
public struct SearchChannelsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(query: String, first: String? = nil, after: String? = nil, liveOnly: String? = nil) {
        self.url = TwitchEndpoints.searchChannels.construct()?.appending(
            queryItems: ["query": query, "first": first, "after": after, "live_only": liveOnly].buildQueryItems())
    }
}
