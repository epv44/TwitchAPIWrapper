//
//  GetStreamKeyRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

///Get stream key request see https://dev.twitch.tv/docs/api/reference/#get-stream-key
public struct GetStreamKeyRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(broadcasterID: String) {
        self.url = TwitchEndpoints.streamKey.construct()?.appending(
            queryItems: ["broadcaster_id": broadcasterID].buildQueryItems())
    }
}
