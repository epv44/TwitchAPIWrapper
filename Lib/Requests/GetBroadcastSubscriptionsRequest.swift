//
//  GetBroadcastSubscriptionsRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/16/21.
//

import Foundation

///Get broadcast subscriptions request see https://dev.twitch.tv/docs/api/reference/#get-broadcaster-subscriptions
public struct GetBroadcastSubscriptionsRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(
        broadcasterID: String,
        userIDs: [String]? = nil,
        after: String? = nil,
        first: String? = nil
    ) {
        self.url = TwitchEndpoints.broadcasterSubscriptions.construct()?.appending(
            queryItems: [
                "broadcaster_id": broadcasterID,
                "user_id": userIDs as Any,
                "after": after as Any,
                "first": first as Any
            ].buildQueryItems())
    }
}
