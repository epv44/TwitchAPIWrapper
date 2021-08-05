//
//  StreamTagRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/20/21.
//

import Foundation

///Get stream tags request https://dev.twitch.tv/docs/api/reference/#get-stream-tags for details
public struct StreamTagRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(broadcasterID: String) {
        self.url = TwitchEndpoints.streamTags.construct()?.appending(queryItems: ["broadcaster_id": broadcasterID].buildQueryItems())
    }
}
