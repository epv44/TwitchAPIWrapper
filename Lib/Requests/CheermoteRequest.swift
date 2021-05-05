//
//  CheermoteRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/4/21.
//

import Foundation

/// Get cheermotes request, see https://dev.twitch.tv/docs/api/reference/#get-cheermotes for details
public struct CheermoteRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(broadcasterID: String? = nil) throws {
        self.url = TwitchEndpoints.cheermotes.construct()?.appending(
            queryItems: ["broadcaster_id": broadcasterID].buildQueryItems())
    }
}

