//
//  FollowedStreamsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

///Get Followed Streams request see https://dev.twitch.tv/docs/api/reference/#get-followed-streams
public struct FollowedStreamsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        userID: String,
        after: String? = nil,
        first: String? = nil
    ) {
        self.url = TwitchEndpoints.followedStreams.construct()?.appending(
            queryItems: [
                "user_id": userID,
                "after": after,
                "first": first
            ].buildQueryItems())
    }
}
