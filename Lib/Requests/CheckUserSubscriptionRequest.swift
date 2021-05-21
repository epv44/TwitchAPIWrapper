//
//  CheckUserSubscriptionRequest.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 5/17/21.
//

import Foundation

/// Get user subscriptions request, see https://dev.twitch.tv/docs/api/reference/#check-user-subscription
public struct CheckUserSubscriptionRequest: JSONConstructableRequest {
    public let url: URL?
    
    public init(broadcasterID: String, userID: String) {
        self.url = TwitchEndpoints.checkUserSubscription.construct()?.appending(
            queryItems: ["broadcaster_id": broadcasterID, "user_id": userID].buildQueryItems())
    }
}
