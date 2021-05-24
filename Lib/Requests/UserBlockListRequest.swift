//
//  UserBlockListRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/23/21.
//

import Foundation

///Get user blocklist request see https://dev.twitch.tv/docs/api/reference/#get-user-block-list
public struct UserBlockListRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        broadcasterID: String,
        first: String? = nil,
        after: String? = nil
    ) throws {
        self.url = TwitchEndpoints.userBlocks.construct()?.appending(
            queryItems: [
                "broadcaster_id": broadcasterID,
                "first": first,
                "after": after].buildQueryItems())
    }
}
